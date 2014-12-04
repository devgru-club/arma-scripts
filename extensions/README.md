
## Extensions Example

```sqf
// using the C++11 native thread library

call callExtension "someExtension.dll"; // initial client request
[...] spawn workerThread; detach        // server eventHandler for _x request responds
call callExtension "someExtension.dll"; // client follow-up to receive calculated values
```

## [Ticket System](#)
Mechanism to retrieve the data from the worker thread. Useful if the client will have to wait for a calculation.

* client submits a task
* client receives a unique ticket associated with the task (includes a wait indicator / expected wait time?)
* client submits ticket
* client either receives results OR receives a wait indicator and resubmits request after specified period

## [Dynamic Calculators](#)
Mechanism to provide dynamic calculations separate from primary server tasks.

* unit behavior
* unit equipment loadouts
* group compositions
* dynamic population density

### Use Case
Client receives dynamic content (dynamically-generated weather patterns) without needing to wait for immediate calculations to occur.

* server periodically generates a new pattern based on calculation tables local to the extension // calculate the weather for the next client request
* client submits a request for a new weather pattern // x time has passed, the game weather is changing
* extension responds with SQF code to generate new (precalculated) weather patterns
* extension generates a new weather pattern to provide upon receiving a new request

## [JSON Parser](/plugins/json-parser.sqf)
Allows for storage/transmission of values in JSON instead of pure sqf.

* data can be made universally available to other extensions.

### Use Cases
* storage of player data (persistence). Allows for better implementation of abstract concepts, i.e. loadouts, persistent populations, player structures, environmental seeding etc.
