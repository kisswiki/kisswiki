```bash
# build single
cargo build --example file

# build all
for i in examples/*; do cargo build --example $(basename $i .rs); done
```
