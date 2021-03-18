# Application Overview

Shuttles need to move between the following Stations
1. Load
2. Powder
3. Print
4. Tamp
5. Offload

Shuttles can likely repeat steps 2-3 numerous times before requiring to go on to the tamp process.
There are two powder depositions areas available and the shuttle can go to either

Startup positions will just be auto-driven to
    How do i start the process from the auto-drive positions?


## Robot Demo
Demo has shuttles integrate with a Delta robot to preform a "picking" or "placing" synchronization

Steps:
1. Shuttles move to recovery position (general position)
2. Send shuttle to load position, when there, sync to virtual master
3. Robot preforms movement to virtual master, shuttle is also tied. becomes synchronized
4. Shuttle then just moves in a circle back to the start to repeat

## Weighing Demo
Demo has just a basic mechanism to showcase the weighing functionality on a shuttle

1. move shuttle to defined location, wait for commands to "land" or "levitate" shuttles
2. Displays weight on HMI


# Architecture
## Shuttles
Shuttles are given a standard state machine
- Off
- Init
- Idle
- Startup
- MoveToLoad
- Load
- Error

Cmd
  - Recover
  - NextStep
Pars
    
Config
- LoadToPrintMacroID
- DoseToPrintMacroID
- PrintToDose1MacroID
- PrintToDose2MacroID
- DoseToPrintMacroID
- PrintToTampMacroID
- TampToUnloadMacroID
- UnloadToLoadMacroID

Status
- CurrentStep
- Destination


## Stations
Stations will wait to receive a shuttle present command/flag from a shuttle before beginning their operation

- Cmd
  - Enable
  - Process
  - Reset
- Par
  - ShuttleID
  - WaitTime
  - (Station Specific Parameters)
    - IndexRate
    - IndexAmount
    - SpinAmount
    - etc..
- Config
  - StationPos
    - X
    - Y
- Status
  - Processing
  - Done
  - Waiting
