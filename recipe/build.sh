mkdir -p build
cd build
cmake ${CMAKE_ARGS} -DCMAKE_INSTALL_PREFIX=${PREFIX} \
      -DCMAKE_PREFIX_PATH=${PREFIX} \
      -DMAGIC_ENUM_OPT_BUILD_EXAMPLES=OFF \
      -DMAGIC_ENUM_OPT_BUILD_TESTS=ON \
      -DMAGIC_ENUM_OPT_INSTALL=ON \
      ..
make -j${CPU_COUNT}
if [[ "$CONDA_BUILD_CROSS_COMPILATION" != "1" ]]; then
  make test
fi
make install
