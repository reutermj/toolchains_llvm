Starting state: pretty much just squashed and rebased on HEAD @peakschris's changes. References:
* https://github.com/peakschris/toolchains_llvm/tree/windows3
* https://github.com/bazel-contrib/toolchains_llvm/pull/342

Issues:
* Symlinks to various llvm executables was failing.
  * https://github.com/bazel-contrib/toolchains_llvm/blob/master/toolchain/internal/common.bzl#L28-L39
  * missing `.exe` extension
* java.io.IOException %1 is not a valid win32 application
  * failing on trying to call `cc_wrapper.sh`.
  * creating a template for a batch file resolved that
  * bazel was running inside powershell
* 'external' is not recognized as an internal or external command
  * batch files dont like unix paths
  * https://github.com/bazel-contrib/toolchains_llvm/blob/master/toolchain/internal/configure.bzl#L224
  * fixed by replacing `'/'` with `'\\'` in `llvm_dist_path_prefix`