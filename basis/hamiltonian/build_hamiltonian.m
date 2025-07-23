diff --git a//dev/null b/hamiltonian/build_hamiltonian.m
index 0000000000000000000000000000000000000000..7cef6db421aa83a51b1bbfbfdd3493588fbf1696 100644
--- a//dev/null
+++ b/hamiltonian/build_hamiltonian.m
@@ -0,0 +1,42 @@
+% build_hamiltonian.m
+% \u6784\u5EFAYbOCl\u7CFB\u7EDF\u7684\u667A\u5149\u5730\u5730-\u58F0\u5B66\u5F3A\u8026\u54CD\u54CD\u54CD\u54CD\u541F\u94A5\u91CF\uFF08\u4E24x24\uFF09
+
+function H = build_hamiltonian(basis_states, Delta, omega, g)
+% \u8F93\u5165\u53C2\u6570\uFF1A
+% - basis_states: generate_basis() \u8F93\u51FA\u7684\u7ED3\u6784\u4F53\u6570\u7EC4\uFF0C\u5305\u542BCEF\u548C\u58F0\u5B66\u4FE1\u606F
+% - Delta: CEF\u6FC0\u53D1\u80FD\u91CF\u5DEE\uFF0C\u5355\u4F4D\u4E0Eomega\u4E00\u81F4\uFF08\u5355\u4F4D\u5982 meV\uFF09
+% - omega: \u58F0\u5B66\u80FD\u91CF\uFF08\u5047\u8BBE\u56DB\u79CD\u5355\u58F0\u5B66\u7B49\u8FDE\uFF09
+% - g: \u667A\u5149\u5730\u5730-\u58F0\u5B66\u8026\u5F3A\u5EA6
+
+    dim = length(basis_states);
+    H = zeros(dim);
+
+    for i = 1:dim
+        for j = 1:dim
+            state_i = basis_states{i};
+            state_j = basis_states{j};
+
+            % -------- \u5BF9\u89D2\u9879\u90E8\u5206 --------
+            if isequal(state_i, state_j)
+                % CEF\u80FD\u7EA7\uFF1A\u8BBECEF1\u4E3A\u57FA\u6001\uFF0CCEF2~4\u6BCF\u7EA7Delta
+                cef_energy = (state_i.cef - 1) * Delta;
+                % \u58F0\u5B66\u80FD\u91CF\uFF1A\u6BCF\u79CD\u6A21\u5F0F\u4E58\u4EE5omega
+                phonon_energy = sum(state_i.phonon) * omega;
+                H(i,j) = cef_energy + phonon_energy;
+            end
+
+            % -------- \u975E\u5BF9\u89D2\u9879\uFF1ACEF-phonon\u8026\u5408\u9879 --------
+            % \u53EA\u8003\u8651\u5355\u58F0\u5B66+CEF\u6001\u4E4B\u95F4\u7684\u7EBF\u6027\u8026\u5408\uFF08dipolar-like\uFF09
+            if abs(state_i.cef - state_j.cef) == 1
+                delta_cef = state_i.cef - state_j.cef;
+                % \u58F0\u5B66\u90E8\u5206\u5FC5\u987B\u53EA\u5DEE\u4E00\u4E2A\u58F0\u5B66
+                delta_phonon = state_i.phonon - state_j.phonon;
+                if sum(abs(delta_phonon)) == 1
+                    % \u5047\u8BBE g \u662F\u6240\u6709\u6A21\u5F0F\u76F8\u540C\u7684\u7B80\u5316\u8026\u5408\u7CFB\u6570
+                    H(i,j) = H(i,j) + g * delta_cef; % \u53EF\u66FF\u6362\u6210\u8026\u5408\u77E9\u9635\u5143
+                end
+            end
+        end
+    end
+end
+
