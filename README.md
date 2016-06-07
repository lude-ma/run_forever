# run_forever
Keep the BRML data acquisition framework alive.

A bash script to repeatedly start the BRML Baxter data acquisition framework after it executed or one of its processes died.

## Usage
In a baxter shell, do
```bash
$ . run_forever.sh <log filename>
```


## Structure of the repository
```bash
.
|
+-- scripts/           implementation of checking in on, killing and restarting processes
```