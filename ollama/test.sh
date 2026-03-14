curl http://127.0.0.1:11434/api/chat \
  -H "Content-Type: application/json" \
  -d '{
    "model": "glm-5:cloud",
    "messages": [
      {
        "role": "user",
        "content": "kaixo, zelan?"
      }
    ]
  }'
