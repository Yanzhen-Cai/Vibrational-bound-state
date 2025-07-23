# Vibrational-bound-state
CEF-phonon Coupling
diff --git a/README.md b/README.md
index 55a2939ab0e030fbae7579093b66cac4566b0027..94fcd91d9f4b7110b4edecf646ddf9f0403c6593 100644
--- a/README.md
+++ b/README.md
@@ -1,2 +1,27 @@
 # Vibrational-bound-state
-CEF-phonon Coupling
+
+MATLAB implementation of a simple crystal electric field (CEF) and phonon
+coupling model for YbOCl. The code constructs a basis of 24 states with up to
+one phonon, builds the corresponding Hamiltonian, and solves it via exact
+ diagonalization.
+
+## Directory structure
+
+```
+basis/      - basis generation
+hamiltonian/ - Hamiltonian assembly
+solver/     - diagonalization routines
+examples/   - example script to run the calculation
+```
+
+## Usage
+
+Run the example script in MATLAB/Octave:
+
+```matlab
+cd examples
+run_YbOCl_example
+```
+
+Adjust `Delta`, `omega`, and `g` in the example to explore different
+coupling regimes.
