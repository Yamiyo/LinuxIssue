arangod --server.endpoint tcp://0.0.0.0:8531 \
  --server.authentication false \
  --agency.my-address tcp://192.168.51.119:8531 \
  --agency.activate true \
  --agency.size 3 \
  --agency.supervision true \
  --database.directory agent1

