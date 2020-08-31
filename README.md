# auto-insert-co-author-githook
A git hook that adds the previous author to the commit message as "Co-authored-by" on the git rebase squash.

## setup
You need setup in the project root directory.

### install lefthook
See [this page](https://github.com/Arkweid/lefthook/blob/master/docs/full_guide.md#installation).

### enable lefthook
Execute below command, and created to `lefthook.yml`.
```shell script
lefthook install
```

### add setting
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

### add hook script
[This script](.lefthook/prepare-commit-msg/insert-co-author.sh) put to `.lefthook/prepare-commit-msg/insert-co-author.sh`.

Finish.
