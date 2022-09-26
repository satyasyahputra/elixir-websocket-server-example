# Elixir WebSocket Server Example

## Fetch dependencies
```
mix deps.get
```

## Run Application
```
mix run --no-halt
```

## Example

### Connect to websocket
`ws://localhost:3000/ws?ch=santuy&from=satya`
```
# example in javascript

# initial websocket
const exampleSocket = new WebSocket("ws://localhost:3000/ws?ch=santuy&from=satya", []);

# listening into websocket
exampleSocket.onmessage = function (event) {
  console.log(`receive message: ${event.data}`);
}

# send message to websocket
exampleSocket.send("halo yang ada di sana");
```
