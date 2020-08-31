# auto-insert-co-author-githook
A git hook that adds the previous author to the commit message as "Co-authored-by" on the git rebase squash.

## setup
You need setup in the project root directory.

### using pre-commit
#### install pre-commit
See [this page](https://pre-commit.com/#install).

#### add a pre-commit configuration
Create `.pre-commit-config.yaml`, and write below setting.
```yaml
- repo: git://github.com/korosuke613/auto-insert-co-author-githook
  rev: master
  hooks:
    - id: insert-co-author
      stages: [prepare-commit-msg]
```

#### install the git hook scripts
```shell script
pre-commit install --hook-type prepare-commit-msg
```


### using lefthook
You need setup in the project root directory.

#### install lefthook
See [this page](https://github.com/Arkweid/lefthook/blob/master/docs/full_guide.md#installation).

#### enable lefthook
Execute below command, and created to `lefthook.yml`.
```shell script
lefthook install
```

#### add setting
Execute below command.
```shell script
lefthook add prepare-commit-msg
```

And add below setting to `lefthook.yml`.

```yaml
prepare-commit-msg:
  parallel: true
  scripts:
    "insert-co-author.sh":
      runner: bash
```

#### add hook script
[This script](insert-co-author.sh) put to `.lefthook/prepare-commit-msg/insert-co-author.sh`.
