# GitHub pyKwalify

This action executes `pykwalify` (https://github.com/Grokzen/pykwalify) against file(s)

## Usage

### Parameters

- `files` - Enter files, wildcards accepted. Examples:
    - `.` - run against all yaml files in a directory recursively (default)
    - `file1.yaml`
    - `file1.yaml file2.yaml`
    - `kustomize/**/*.yaml mychart/*values.yaml`
- `schema` - Schema definition file
- `strict` - Enables strict validation of all keywords for all Rule objects to find unsupported keyword usage

### Example usage in workflow

```yaml
name: pyKwalify
on: [push]
jobs:
  lintAllTheThings:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: yaml-lint
      uses: eliezio/action-pykwalify@v1
      with:
        files: myfolder/*values*.yaml
        schema: .schema.yml
```
