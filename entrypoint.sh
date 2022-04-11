uname -a
# rustc --print target-list

PKG_CONFIG_ALLOW_CROSS=1 cargo +nightly build --target x86_64-unknown-linux-gnu --release && \
echo "Built release artifact" && \
cp target/x86_64-unknown-linux-gnu/release/librvoicehook.so /out/gmsv_rvoicehook_linux64.dll
