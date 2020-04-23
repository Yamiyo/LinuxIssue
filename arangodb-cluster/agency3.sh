arangod --server.endpoint tcp://0.0.0.0:8533 \
  --agency.my-address tcp://192.168.51.119:8533 \
  --server.authentication false \
  --agency.activate true \
  --agency.size 3 \
  --agency.endpoint tcp://192.168.51.119:8531 \
  --agency.endpoint tcp://192.168.51.119:8532 \ 
  --agency.endpoint tcp://192.168.51.119:8533 \
  --agency.supervision true \
  --database.directory agent3

