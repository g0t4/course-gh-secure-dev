# commands

```bash
git clone https://github.com/github/codeql.git ~/repos/github/github/codeql

# cd to this repo root

codeql database create --language=csharp --source-root=./examples/dotnet/ testdotnetdb --overwrite

codeql database analyze testdotnetdb/ --format=csv --output=output.csv \
    ~/repos/github/github/codeql/csharp/ql/src/codeql-suites/csharp-code-scanning.qls \
    --rerun
```
