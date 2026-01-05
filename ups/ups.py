import subprocess
import re
from   http.server import HTTPServer, BaseHTTPRequestHandler

UPS_NAME    = "salicru"
SERVER_IP   = "0.0.0.0"
SERVER_PORT = 3002

from http.server import HTTPServer, BaseHTTPRequestHandler

class SimpleHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/':
            gus = self.get_ups_status(UPS_NAME)
            print(gus)
            rt  = ''
            for key, value in gus.items():
                rt = f"{rt}{key}: {value}\n"
            hs  = 200 if gus['ups.status'] == 'OL' else 500
            self.send_response(hs)
            self.send_header("Content-Type", "text/plain")
            self.end_headers()
            self.wfile.write(f"{rt}".encode('utf-8'))

        else:
            self.send_response(404)
            self.send_header("Content-Type", "text/plain")
            self.end_headers()
            self.wfile.write(b"Not Found")

    def get_ups_status(self, ups_name):
        try:
            output = subprocess.check_output(
            ["upsc", ups_name],
            stderr = subprocess.DEVNULL, universal_newlines=True)
            return dict(line.split(": ", 1) for line in output.strip().split("\n") if ": " in line)

        except subprocess.CalledProcessError as e:
            print("Error getting UPS status:", e)
            return ''

if __name__ == "__main__":
    server_address = (SERVER_IP, SERVER_PORT)
    httpd = HTTPServer(server_address, SimpleHandler)
    print(f"UPS Server running on http://{SERVER_IP}:{SERVER_PORT}")
    httpd.serve_forever()
