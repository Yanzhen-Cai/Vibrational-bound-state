diff --git a//dev/null b/basis/generate_basis.m
index 0000000000000000000000000000000000000000..aeab72f636a05ed90629f9b5facd3249ef965a42 100644
--- a//dev/null
+++ b/basis/generate_basis.m
@@ -0,0 +1,33 @@
+% generate_basis.m
+% \u6784\u5EFA\u667A\u5149\u5730\u5730\u58F0\u5B66\u54CD\u5408\u6A21\u578B\u4E2D\u7528\u4E8E\u4E25\u683C\u5BF9\u89D2\u5316\u7684\u57FA\u77E2\u96C6\u5408\uFF08\u5171 24 个\uFF09
+
+function [basis_labels, basis_states] = generate_basis()
+    % \u667A\u5149\u5730\u5730\u90E8\u5206\u57FA\u6001\uFF08\u5047\u8BBE4\u4E2A\u8C9A\u81EA\u65CB\u6001 |1>, |2>, |3>, |4>\uFF09
+    num_cef_states = 4;
+
+    % \u58F0\u5B66\u90E8\u5206\uFF0C\u96F6\u58F0\u5B66\u6001\uFF081\u79CD\uFF09+ \u4E24\u79CD\u6A21\u5F0F\u4E0B\u7684\u5355\u58F0\u5B66\u6001\uFF08\u54042\u79CD\uFF09
+    % \u6A21\u5F0F1: a^\u2021_x, a^\u2021_y
+    % \u6A21\u5F0F2: b^\u2021_x, b^\u2021_y
+    phonon_labels = {'0', 'a_x', 'a_y', 'b_x', 'b_y'};
+
+    basis_labels = {};
+    basis_states = {};
+
+    % \u96F6\u58F0\u5B66\u5B50\u7A7A\u95F4\uFF1A4\u4E2ACEF\u6001 \u00D7 \u96F6\u58F0\u5B66
+    for i = 1:num_cef_states
+        label = sprintf('|CEF%d> x |0>', i);
+        basis_labels{end+1} = label;
+        basis_states{end+1} = struct('cef', i, 'phonon', [0,0,0,0]);
+    end
+
+    % \u5355\u58F0\u5B66\u5B50\u7A7A\u95F4\uFF1A4\u4E2ACEF\u6001 \u00D7 4\u4E2A\u5355\u58F0\u5B66\u6A21\u5F0F\uFF08a_x, a_y, b_x, b_y\uFF09
+    phonon_modes = eye(4); % \u6BCF\u79CD\u58F0\u5B66\u4E3A 1\uFF0C\u5176\u4F59\u4E3A 0
+    for i = 1:num_cef_states
+        for j = 1:4
+            label = sprintf('|CEF%d> x |%s>', i, phonon_labels{j+1});
+            basis_labels{end+1} = label;
+            basis_states{end+1} = struct('cef', i, 'phonon', phonon_modes(j,:));
+        end
+    end
+end
+
