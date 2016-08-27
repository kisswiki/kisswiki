## build all

`for i in examples/*; do cargo build --target=x86_64-pc-windows-gnu --verbose --example $(basename $i .rs); done`
