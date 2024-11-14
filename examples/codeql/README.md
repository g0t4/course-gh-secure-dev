# commands

```bash
git clone https://github.com/github/codeql.git ~/repos/github/github/codeql

# cd to this repo root

# all csharp code in repo:
codeql database create --language=csharp testdotnetdb --overwrite
# or, just examples/codeql folder:
codeql database create --language=csharp --source-root=./examples/codeql/ testdotnetdb --overwrite

# one query
codeql database analyze testdotnetdb/ --format=csv --output=codeql.results.csv \
    ~/repos/github/github/codeql/csharp/ql/src/Security\ Features/CWE-548/ASPNetDirectoryListing.ql \
    --rerun

# standard suite (all queries)
codeql database analyze testdotnetdb/ --format=csv --output=codeql.results.csv \
    ~/repos/github/github/codeql/csharp/ql/src/codeql-suites/csharp-code-scanning.qls \
    --rerun

# extended suite (all queries)
codeql database analyze testdotnetdb/ --format=csv --output=codeql.extended.results.csv \
    ~/repos/github/github/codeql/csharp/ql/src/codeql-suites/csharp-security-extended.qls \
    --rerun

# query alerts (results):
#  warning - ASP.NET config file enables directory browsing
#  error - Missing X-Frame-Options HTTP header

```
