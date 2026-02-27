INSERT INTO topics (id, name, order_index) VALUES
(1, 'Two Pointer Patterns', 1),
(2, 'Sliding Window Patterns', 2),
(3, 'Tree Traversal Patterns (DFS & BFS)', 3),
(4, 'Graph Traversal Patterns (DFS & BFS)', 4),
(5, 'Dynamic Programming (DP) Patterns', 5),
(6, 'Heap (Priority Queue) Patterns', 6),
(7, 'Backtracking Patterns', 7),
(8, 'Greedy Patterns', 8),
(9, 'Binary Search Patterns', 9),
(10, 'Stack Patterns', 10),
(11, 'Bit Manipulation Patterns', 11),
(12, 'Linked List Manipulation Patterns', 12),
(13, 'Array/Matrix Manipulation Patterns', 13),
(14, 'String Manipulation Patterns', 14),
(15, 'Design Patterns', 15);


INSERT INTO patterns (id, name, order_index, topic_id) VALUES
-- I. Two Pointer Patterns (topic_id = 1)
(1, 'Two Pointers - Converging (Sorted Array Target Sum)', 1, 1),
(2, 'Two Pointers - Fast & Slow (Cycle Detection)', 2, 1),
(3, 'Two Pointers - Fixed Separation (Nth Node from End)', 3, 1),
(4, 'Two Pointers - In-place Array Modification', 4, 1),
(5, 'Two Pointers - String Comparison with Backspaces', 5, 1),
(6, 'Two Pointers - Expanding From Center (Palindromes)', 6, 1),
(7, 'Two Pointers - String Reversal', 7, 1),

-- II. Sliding Window Patterns (topic_id = 2)
(8, 'Sliding Window - Fixed Size (Subarray Calculation)', 8, 2),
(9, 'Sliding Window - Variable Size (Condition-Based)', 9, 2),
(10, 'Sliding Window - Monotonic Queue for Max/Min', 10, 2),
(11, 'Sliding Window - Character Frequency Matching', 11, 2),

-- III. Tree Traversal Patterns (topic_id = 3)
(12, 'Tree BFS - Level Order Traversal', 12, 3),
(13, 'Tree DFS - Recursive Preorder Traversal', 13, 3),
(14, 'Tree DFS - Recursive Inorder Traversal', 14, 3),
(15, 'Tree DFS - Recursive Postorder Traversal', 15, 3),
(16, 'Tree - Lowest Common Ancestor (LCA) Finding', 16, 3),
(17, 'Tree - Serialization and Deserialization', 17, 3),

-- IV. Graph Traversal Patterns (topic_id = 4)
(18, 'Graph DFS - Connected Components / Island Counting', 18, 4),
(19, 'Graph BFS - Connected Components / Island Counting', 19, 4),
(20, 'Graph DFS - Cycle Detection (Directed Graph)', 20, 4),
(21, 'Graph BFS - Topological Sort (Kahn''s Algorithm)', 21, 4),
(22, 'Graph - Deep Copy / Cloning', 22, 4),
(23, 'Graph - Shortest Path (Dijkstra''s Algorithm)', 23, 4),
(24, 'Graph - Shortest Path (Bellman-Ford / BFS+K)', 24, 4),
(25, 'Graph - Union-Find (Disjoint Set Union - DSU)', 25, 4),
(26, 'Strongly Connected Components (Kosaraju / Tarjan)', 26, 4),
(27, 'Bridges & Articulation Points (Tarjan Low-Link)', 27, 4),
(28, 'Minimum Spanning Tree (Kruskal / Prim / DSU + Heap)', 28, 4),
(29, 'Bidirectional BFS (Optimization for Known Source & Target)', 29, 4),

-- V. Dynamic Programming Patterns (topic_id = 5)
(30, 'DP - 1D Array (Fibonacci Style)', 30, 5),
(31, 'DP - 1D Array (Kadane''s Algorithm)', 31, 5),
(32, 'DP - 1D Array (Coin Change / Unbounded Knapsack)', 32, 5),
(33, 'DP - 1D Array (0/1 Knapsack / Subset Sum)', 33, 5),
(34, 'DP - 1D Array (Word Break)', 34, 5),
(35, 'DP - 2D Array (Longest Common Subsequence - LCS)', 35, 5),
(36, 'DP - 2D Array (Edit Distance / Levenshtein)', 36, 5),
(37, 'DP - 2D Array (Unique Paths on Grid)', 37, 5),
(38, 'DP - Interval DP', 38, 5),
(39, 'DP - Catalan Numbers', 39, 5),
(40, 'DP - Longest Increasing Subsequence (LIS)', 40, 5),
(41, 'DP - Stock Problems', 41, 5),

-- VI. Heap Patterns (topic_id = 6)
(42, 'Heap - Top K Elements', 42, 6),
(43, 'Heap - Two Heaps for Median Finding', 43, 6),
(44, 'Heap - K-way Merge', 44, 6),
(45, 'Heap - Scheduling / Minimum Cost', 45, 6),

-- VII. Backtracking Patterns (topic_id = 7)
(46, 'Backtracking - Subsets', 46, 7),
(47, 'Backtracking - Permutations', 47, 7),
(48, 'Backtracking - Combination Sum', 48, 7),
(49, 'Backtracking - Parentheses Generation', 49, 7),
(50, 'Backtracking - Word Search / Grid Path', 50, 7),
(51, 'Backtracking - N-Queens / Constraint Satisfaction', 51, 7),
(52, 'Backtracking - Palindrome Partitioning', 52, 7),

-- VIII. Greedy Patterns (topic_id = 8)
(53, 'Greedy - Interval Merging/Scheduling', 53, 8),
(54, 'Greedy - Jump Game', 54, 8),
(55, 'Greedy - Buy/Sell Stock', 55, 8),
(56, 'Greedy - Gas Station Circuit', 56, 8),
(57, 'Greedy - Task Scheduling', 57, 8),
(58, 'Greedy - Sorting Based', 58, 8),

-- IX. Binary Search Patterns (topic_id = 9)
(59, 'Binary Search - Sorted Array', 59, 9),
(60, 'Binary Search - Rotated Sorted Array', 60, 9),
(61, 'Binary Search - On Answer', 61, 9),
(62, 'Binary Search - First/Last Occurrence', 62, 9),
(63, 'Binary Search - Median/Kth in Two Sorted Arrays', 63, 9),

-- X. Stack Patterns (topic_id = 10)
(64, 'Stack - Valid Parentheses', 64, 10),
(65, 'Stack - Monotonic Stack', 65, 10),
(66, 'Stack - Expression Evaluation', 66, 10),
(67, 'Stack - Simulation Helper', 67, 10),
(68, 'Stack - Min Stack Design', 68, 10),
(69, 'Stack - Largest Rectangle in Histogram', 69, 10),

-- XI. Bit Manipulation Patterns (topic_id = 11)
(70, 'Bitwise XOR - Single/Missing Number', 70, 11),
(71, 'Bitwise AND - Counting Set Bits', 71, 11),
(72, 'Bitwise DP - Counting Bits', 72, 11),
(73, 'Bitwise - Power of Two/Four Check', 73, 11),

-- XII. Linked List Patterns (topic_id = 12)
(74, 'Linked List - In-place Reversal', 74, 12),
(75, 'Linked List - Merge Two Sorted Lists', 75, 12),
(76, 'Linked List - Add Two Numbers', 76, 12),
(77, 'Linked List - Intersection Detection', 77, 12),
(78, 'Linked List - Reordering / Partitioning', 78, 12),

-- XIII. Array/Matrix Patterns (topic_id = 13)
(79, 'Array/Matrix - In-place Rotation', 79, 13),
(80, 'Array/Matrix - Spiral Traversal', 80, 13),
(81, 'Array/Matrix - Set Matrix Zeroes', 81, 13),
(82, 'Array - Product Except Self', 82, 13),
(83, 'Array - Plus One', 83, 13),
(84, 'Array - Merge Sorted Array', 84, 13),
(85, 'Array - Cyclic Sort', 85, 13),

-- XIV. String Patterns (topic_id = 14)
(86, 'String - Palindrome Check', 86, 14),
(87, 'String - Anagram Check', 87, 14),
(88, 'String - Roman to Integer', 88, 14),
(89, 'String - String to Integer (atoi)', 89, 14),
(90, 'String - Multiply Strings', 90, 14),
(91, 'String Matching - KMP / Rabin-Karp', 91, 14),
(92, 'String - Repeated Substring Pattern', 92, 14),

-- XV. Design Patterns (topic_id = 15)
(93, 'Design - General/Specific Patterns', 93, 15),
(94, 'Tries', 94, 15);



INSERT INTO problems
(id, title, difficulty, difficulty_score, leetcode_url, order_index, pattern_id)
VALUES

-- Pattern 1: Converging (pattern_id = 1)
(1, 'Container With Most Water', 'MEDIUM', 6, 'https://leetcode.com/problems/container-with-most-water/', 1, 1),
(2, '3Sum', 'MEDIUM', 6, 'https://leetcode.com/problems/3sum/', 2, 1),
(3, '3Sum Closest', 'MEDIUM', 6, 'https://leetcode.com/problems/3sum-closest/', 3, 1),
(4, '4Sum', 'MEDIUM', 6, 'https://leetcode.com/problems/4sum/', 4, 1),
(5, 'Two Sum II - Input Array Is Sorted', 'MEDIUM', 6, 'https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/', 5, 1),
(6, 'Intersection of Two Arrays', 'EASY', 3, 'https://leetcode.com/problems/intersection-of-two-arrays/', 6, 1),
(7, 'Boats to Save People', 'MEDIUM', 6, 'https://leetcode.com/problems/boats-to-save-people/', 7, 1),
(8, 'Squares of a Sorted Array', 'EASY', 3, 'https://leetcode.com/problems/squares-of-a-sorted-array/', 8, 1),
(9, '3Sum Smaller', 'MEDIUM', 6, 'https://leetcode.com/problems/3sum-smaller/', 9, 1),

-- Pattern 2: Fast & Slow (pattern_id = 2)
(10, 'Linked List Cycle', 'EASY', 3, 'https://leetcode.com/problems/linked-list-cycle/', 1, 2),
(11, 'Happy Number', 'EASY', 3, 'https://leetcode.com/problems/happy-number/', 2, 2),
(12, 'Find the Duplicate Number', 'MEDIUM', 6, 'https://leetcode.com/problems/find-the-duplicate-number/', 3, 2),
(13, 'Is Subsequence', 'EASY', 3, 'https://leetcode.com/problems/is-subsequence/', 4, 2),

-- Pattern 3: Fixed Separation (pattern_id = 3)
(14, 'Remove Nth Node From End of List', 'MEDIUM', 6, 'https://leetcode.com/problems/remove-nth-node-from-end-of-list/', 1, 3),
(15, 'Middle of the Linked List', 'EASY', 3, 'https://leetcode.com/problems/middle-of-the-linked-list/', 2, 3),
(16, 'Delete the Middle Node of a Linked List', 'MEDIUM', 6, 'https://leetcode.com/problems/delete-the-middle-node-of-a-linked-list/', 3, 3),

-- Pattern 4: In-place Array Modification (pattern_id = 4)
(17, 'Remove Duplicates from Sorted Array', 'EASY', 3, 'https://leetcode.com/problems/remove-duplicates-from-sorted-array/', 1, 4),
(18, 'Remove Element', 'EASY', 3, 'https://leetcode.com/problems/remove-element/', 2, 4),
(19, 'Sort Colors', 'MEDIUM', 6, 'https://leetcode.com/problems/sort-colors/', 3, 4),
(20, 'Remove Duplicates from Sorted Array II', 'MEDIUM', 6, 'https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/', 4, 4),
(21, 'Move Zeroes', 'EASY', 3, 'https://leetcode.com/problems/move-zeroes/', 5, 4),
(22, 'String Compression', 'MEDIUM', 6, 'https://leetcode.com/problems/string-compression/', 6, 4),
(23, 'Sort Array By Parity', 'EASY', 3, 'https://leetcode.com/problems/sort-array-by-parity/', 7, 4),
(24, 'Move Pieces to Obtain a String', 'MEDIUM', 6, 'https://leetcode.com/problems/move-pieces-to-obtain-a-string/', 8, 4),
(25, 'Separate Black and White Balls', 'MEDIUM', 6, 'https://leetcode.com/problems/separate-black-and-white-balls/', 9, 4),

-- Pattern 5: String Comparison with Backspaces (pattern_id = 5)
(26, 'Backspace String Compare', 'EASY', 3, 'https://leetcode.com/problems/backspace-string-compare/', 1, 5),
(27, 'Crawler Log Folder', 'EASY', 3, 'https://leetcode.com/problems/crawler-log-folder/', 2, 5),
(28, 'Removing Stars From a String', 'MEDIUM', 6, 'https://leetcode.com/problems/removing-stars-from-a-string/', 3, 5),

-- Pattern 6: Expanding From Center (pattern_id = 6)
(29, 'Longest Palindromic Substring', 'MEDIUM', 6, 'https://leetcode.com/problems/longest-palindromic-substring/', 1, 6),
(30, 'Palindromic Substrings', 'MEDIUM', 6, 'https://leetcode.com/problems/palindromic-substrings/', 2, 6),

-- Pattern 7: String Reversal (pattern_id = 7)
(31, 'Reverse Words in a String', 'MEDIUM', 6, 'https://leetcode.com/problems/reverse-words-in-a-string/', 1, 7),
(32, 'Reverse String', 'EASY', 3, 'https://leetcode.com/problems/reverse-string/', 2, 7),
(33, 'Reverse Vowels of a String', 'EASY', 3, 'https://leetcode.com/problems/reverse-vowels-of-a-string/', 3, 7),
(34, 'Reverse String II', 'EASY', 3, 'https://leetcode.com/problems/reverse-string-ii/', 4, 7);

INSERT INTO problems
(id, title, difficulty, difficulty_score, leetcode_url, order_index, pattern_id)
VALUES

-- Pattern 8: Fixed Size (pattern_id = 8)
(35, 'Moving Average from Data Stream', 'EASY', 3, 'https://leetcode.com/problems/moving-average-from-data-stream/', 1, 8),
(36, 'Maximum Average Subarray I', 'EASY', 3, 'https://leetcode.com/problems/maximum-average-subarray-i/', 2, 8),
(37, 'Calculate Compressed Mean', 'EASY', 3, 'https://leetcode.com/problems/calculate-compressed-mean/', 3, 8),
(38, 'Find the Power of K-Size Subarrays I', 'MEDIUM', 6, 'https://leetcode.com/problems/find-the-power-of-k-size-subarrays-i/', 4, 8),
(39, 'Find X-Sum of All K-Long Subarrays I', 'MEDIUM', 6, 'https://leetcode.com/problems/find-x-sum-of-all-k-long-subarrays-i/', 5, 8),

-- Pattern 9: Variable Size (pattern_id = 9)
(40, 'Longest Substring Without Repeating Characters', 'MEDIUM', 6, 'https://leetcode.com/problems/longest-substring-without-repeating-characters/', 1, 9),
(41, 'Minimum Window Substring', 'HARD', 9, 'https://leetcode.com/problems/minimum-window-substring/', 2, 9),
(42, 'Minimum Size Subarray Sum', 'MEDIUM', 6, 'https://leetcode.com/problems/minimum-size-subarray-sum/', 3, 9),
(43, 'Contains Duplicate II', 'EASY', 3, 'https://leetcode.com/problems/contains-duplicate-ii/', 4, 9),
(44, 'Longest Repeating Character Replacement', 'MEDIUM', 6, 'https://leetcode.com/problems/longest-repeating-character-replacement/', 5, 9),
(45, 'Subarray Product Less Than K', 'MEDIUM', 6, 'https://leetcode.com/problems/subarray-product-less-than-k/', 6, 9),
(46, 'Fruit Into Baskets', 'MEDIUM', 6, 'https://leetcode.com/problems/fruit-into-baskets/', 7, 9),
(47, 'Max Consecutive Ones III', 'MEDIUM', 6, 'https://leetcode.com/problems/max-consecutive-ones-iii/', 8, 9),
(48, 'Longest Continuous Subarray With Absolute Diff Less Than or Equal to Limit', 'MEDIUM', 6, 'https://leetcode.com/problems/longest-continuous-subarray-with-absolute-diff-less-than-or-equal-to-limit/', 9, 9),
(49, 'Longest Subarray of 1s After Deleting One Element', 'MEDIUM', 6, 'https://leetcode.com/problems/longest-subarray-of-1s-after-deleting-one-element/', 10, 9),
(50, 'Minimum Operations to Reduce X to Zero', 'MEDIUM', 6, 'https://leetcode.com/problems/minimum-operations-to-reduce-x-to-zero/', 11, 9),
(51, 'Frequency of the Most Frequent Element', 'MEDIUM', 6, 'https://leetcode.com/problems/frequency-of-the-most-frequent-element/', 12, 9),
(52, 'Maximum Sum of Distinct Subarrays With Length K', 'MEDIUM', 6, 'https://leetcode.com/problems/maximum-sum-of-distinct-subarrays-with-length-k/', 13, 9),
(53, 'Take K of Each Character From Left and Right', 'MEDIUM', 6, 'https://leetcode.com/problems/take-k-of-each-character-from-left-and-right/', 14, 9),
(54, 'Continuous Subarrays', 'MEDIUM', 6, 'https://leetcode.com/problems/continuous-subarrays/', 15, 9),
(55, 'Maximum Beauty of an Array After Applying Operation', 'MEDIUM', 6, 'https://leetcode.com/problems/maximum-beauty-of-an-array-after-applying-operation/', 16, 9),
(56, 'Find Longest Special Substring That Occurs Thrice I', 'MEDIUM', 6, 'https://leetcode.com/problems/find-longest-special-substring-that-occurs-thrice-i/', 17, 9),
(57, 'Maximum Good Subarray Sum', 'MEDIUM', 6, 'https://leetcode.com/problems/maximum-good-subarray-sum/', 18, 9),
(58, 'Maximum Frequency After Performing Operations I', 'MEDIUM', 6, 'https://leetcode.com/problems/maximum-frequency-after-performing-operations-i/', 19, 9),
(59, 'Maximum Frequency After Performing Operations II', 'HARD', 9, 'https://leetcode.com/problems/maximum-frequency-after-performing-operations-ii/', 20, 9),

-- Pattern 10: Monotonic Queue (pattern_id = 10)
(60, 'Sliding Window Maximum', 'HARD', 9, 'https://leetcode.com/problems/sliding-window-maximum/', 1, 10),
(61, 'Shortest Subarray with Sum at Least K', 'HARD', 9, 'https://leetcode.com/problems/shortest-subarray-with-sum-at-least-k/', 2, 10),
(62, 'Jump Game VI', 'MEDIUM', 6, 'https://leetcode.com/problems/jump-game-vi/', 3, 10),

-- Pattern 11: Character Frequency Matching (pattern_id = 11)
(63, 'Two Sum', 'EASY', 3, 'https://leetcode.com/problems/two-sum/', 1, 11),
(64, 'Find All Anagrams in a String', 'MEDIUM', 6, 'https://leetcode.com/problems/find-all-anagrams-in-a-string/', 2, 11),
(65, 'Permutation in String', 'MEDIUM', 6, 'https://leetcode.com/problems/permutation-in-string/', 3, 11);


INSERT INTO problems
(id, title, difficulty, difficulty_score, leetcode_url, order_index, pattern_id)
VALUES

-- Pattern 12: Tree BFS - Level Order (pattern_id = 12)
(66, 'Binary Tree Level Order Traversal', 'MEDIUM', 6, 'https://leetcode.com/problems/binary-tree-level-order-traversal/', 1, 12),
(67, 'Binary Tree Zigzag Level Order Traversal', 'MEDIUM', 6, 'https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/', 2, 12),
(68, 'Binary Tree Right Side View', 'MEDIUM', 6, 'https://leetcode.com/problems/binary-tree-right-side-view/', 3, 12),
(69, 'Find Largest Value in Each Tree Row', 'MEDIUM', 6, 'https://leetcode.com/problems/find-largest-value-in-each-tree-row/', 4, 12),
(70, 'Maximum Level Sum of a Binary Tree', 'MEDIUM', 6, 'https://leetcode.com/problems/maximum-level-sum-of-a-binary-tree/', 5, 12),

-- Pattern 13: Tree DFS - Preorder (pattern_id = 13)
(71, 'Same Tree', 'EASY', 3, 'https://leetcode.com/problems/same-tree/', 1, 13),
(72, 'Symmetric Tree', 'EASY', 3, 'https://leetcode.com/problems/symmetric-tree/', 2, 13),
(73, 'Construct Binary Tree from Preorder and Inorder Traversal', 'MEDIUM', 6, 'https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/', 3, 13),
(74, 'Flatten Binary Tree to Linked List', 'MEDIUM', 6, 'https://leetcode.com/problems/flatten-binary-tree-to-linked-list/', 4, 13),
(75, 'Invert Binary Tree', 'EASY', 3, 'https://leetcode.com/problems/invert-binary-tree/', 5, 13),
(76, 'Binary Tree Paths', 'EASY', 3, 'https://leetcode.com/problems/binary-tree-paths/', 6, 13),
(77, 'Smallest String Starting From Leaf', 'MEDIUM', 6, 'https://leetcode.com/problems/smallest-string-starting-from-leaf/', 7, 13),

-- Pattern 14: Tree DFS - Inorder (pattern_id = 14)
(78, 'Binary Tree Inorder Traversal', 'EASY', 3, 'https://leetcode.com/problems/binary-tree-inorder-traversal/', 1, 14),
(79, 'Validate Binary Search Tree', 'MEDIUM', 6, 'https://leetcode.com/problems/validate-binary-search-tree/', 2, 14),
(80, 'Binary Search Tree Iterator', 'MEDIUM', 6, 'https://leetcode.com/problems/binary-search-tree-iterator/', 3, 14),
(81, 'Kth Smallest Element in a BST', 'MEDIUM', 6, 'https://leetcode.com/problems/kth-smallest-element-in-a-bst/', 4, 14),
(82, 'Find Mode in Binary Search Tree', 'EASY', 3, 'https://leetcode.com/problems/find-mode-in-binary-search-tree/', 5, 14),
(83, 'Minimum Absolute Difference in BST', 'EASY', 3, 'https://leetcode.com/problems/minimum-absolute-difference-in-bst/', 6, 14),

-- Pattern 15: Tree DFS - Postorder (pattern_id = 15)
(84, 'Maximum Depth of Binary Tree', 'EASY', 3, 'https://leetcode.com/problems/maximum-depth-of-binary-tree/', 1, 15),
(85, 'Balanced Binary Tree', 'EASY', 3, 'https://leetcode.com/problems/balanced-binary-tree/', 2, 15),
(86, 'Binary Tree Maximum Path Sum', 'HARD', 9, 'https://leetcode.com/problems/binary-tree-maximum-path-sum/', 3, 15),
(87, 'Binary Tree Postorder Traversal', 'EASY', 3, 'https://leetcode.com/problems/binary-tree-postorder-traversal/', 4, 15),
(88, 'House Robber III', 'MEDIUM', 6, 'https://leetcode.com/problems/house-robber-iii/', 5, 15),
(89, 'Find Leaves of Binary Tree', 'MEDIUM', 6, 'https://leetcode.com/problems/find-leaves-of-binary-tree/', 6, 15),
(90, 'Diameter of Binary Tree', 'EASY', 3, 'https://leetcode.com/problems/diameter-of-binary-tree/', 7, 15),
(91, 'All Nodes Distance K in Binary Tree', 'MEDIUM', 6, 'https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree/', 8, 15),
(92, 'Delete Nodes And Return Forest', 'MEDIUM', 6, 'https://leetcode.com/problems/delete-nodes-and-return-forest/', 9, 15),
(93, 'Height of Binary Tree After Subtree Removal Queries', 'HARD', 9, 'https://leetcode.com/problems/height-of-binary-tree-after-subtree-removal-queries/', 10, 15),

-- Pattern 16: LCA (pattern_id = 16)
(94, 'Lowest Common Ancestor of a Binary Search Tree', 'EASY', 3, 'https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/', 1, 16),
(95, 'Lowest Common Ancestor of a Binary Tree', 'MEDIUM', 6, 'https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/', 2, 16),

-- Pattern 17: Serialization (pattern_id = 17)
(96, 'Serialize and Deserialize Binary Tree', 'HARD', 9, 'https://leetcode.com/problems/serialize-and-deserialize-binary-tree/', 1, 17),
(97, 'Subtree of Another Tree', 'EASY', 3, 'https://leetcode.com/problems/subtree-of-another-tree/', 2, 17),
(98, 'Find Duplicate Subtrees', 'MEDIUM', 6, 'https://leetcode.com/problems/find-duplicate-subtrees/', 3, 17);


INSERT INTO problems
(id, title, difficulty, difficulty_score, leetcode_url, order_index, pattern_id)
VALUES

-- Pattern 18: Graph DFS - Connected Components
(99, 'Surrounded Regions', 'MEDIUM', 6, 'https://leetcode.com/problems/surrounded-regions/', 1, 18),
(100, 'Number of Islands', 'MEDIUM', 6, 'https://leetcode.com/problems/number-of-islands/', 2, 18),
(101, 'Pacific Atlantic Water Flow', 'MEDIUM', 6, 'https://leetcode.com/problems/pacific-atlantic-water-flow/', 3, 18),
(102, 'Number of Provinces', 'MEDIUM', 6, 'https://leetcode.com/problems/number-of-provinces/', 4, 18),
(103, 'Max Area of Island', 'MEDIUM', 6, 'https://leetcode.com/problems/max-area-of-island/', 5, 18),
(104, 'Flood Fill', 'EASY', 3, 'https://leetcode.com/problems/flood-fill/', 6, 18),
(105, 'Keys and Rooms', 'MEDIUM', 6, 'https://leetcode.com/problems/keys-and-rooms/', 7, 18),
(106, 'Number of Enclaves', 'MEDIUM', 6, 'https://leetcode.com/problems/number-of-enclaves/', 8, 18),
(107, 'Number of Closed Islands', 'MEDIUM', 6, 'https://leetcode.com/problems/number-of-closed-islands/', 9, 18),
(108, 'Count Sub Islands', 'MEDIUM', 6, 'https://leetcode.com/problems/count-sub-islands/', 10, 18),
(109, 'Detonate the Maximum Bombs', 'MEDIUM', 6, 'https://leetcode.com/problems/detonate-the-maximum-bombs/', 11, 18),

-- Pattern 19: Graph BFS - Connected Components
(110, '01 Matrix', 'MEDIUM', 6, 'https://leetcode.com/problems/01-matrix/', 1, 19),
(111, 'Rotting Oranges', 'MEDIUM', 6, 'https://leetcode.com/problems/rotting-oranges/', 2, 19),
(112, 'Shortest Path in Binary Matrix', 'MEDIUM', 6, 'https://leetcode.com/problems/shortest-path-in-binary-matrix/', 3, 19),

-- Pattern 20: Graph DFS - Cycle Detection
(113, 'Course Schedule', 'MEDIUM', 6, 'https://leetcode.com/problems/course-schedule/', 1, 20),
(114, 'Course Schedule II', 'MEDIUM', 6, 'https://leetcode.com/problems/course-schedule-ii/', 2, 20),
(115, 'Find Eventual Safe States', 'MEDIUM', 6, 'https://leetcode.com/problems/find-eventual-safe-states/', 3, 20),
(116, 'All Paths from Source Lead to Destination', 'MEDIUM', 6, 'https://leetcode.com/problems/all-paths-from-source-lead-to-destination/', 4, 20),

-- Pattern 21: Graph BFS - Topological Sort
(117, 'Course Schedule II', 'MEDIUM', 6, 'https://leetcode.com/problems/course-schedule-ii/', 1, 21),
(118, 'Alien Dictionary', 'HARD', 9, 'https://leetcode.com/problems/alien-dictionary/', 2, 21),
(119, 'Minimum Height Trees', 'MEDIUM', 6, 'https://leetcode.com/problems/minimum-height-trees/', 3, 21),
(120, 'Sequence Reconstruction', 'MEDIUM', 6, 'https://leetcode.com/problems/sequence-reconstruction/', 4, 21),
(121, 'Parallel Courses', 'MEDIUM', 6, 'https://leetcode.com/problems/parallel-courses/', 5, 21),
(122, 'Largest Color Value in a Directed Graph', 'HARD', 9, 'https://leetcode.com/problems/largest-color-value-in-a-directed-graph/', 6, 21),
(123, 'Parallel Courses III', 'HARD', 9, 'https://leetcode.com/problems/parallel-courses-iii/', 7, 21),
(124, 'Find All Possible Recipes from Given Supplies', 'MEDIUM', 6, 'https://leetcode.com/problems/find-all-possible-recipes-from-given-supplies/', 8, 21),
(125, 'Build a Matrix With Conditions', 'HARD', 9, 'https://leetcode.com/problems/build-a-matrix-with-conditions/', 9, 21),

-- Pattern 22: Graph - Deep Copy / Cloning
(126, 'Clone Graph', 'MEDIUM', 6, 'https://leetcode.com/problems/clone-graph/', 1, 22),
(127, 'Find the City With the Smallest Number of Neighbors', 'MEDIUM', 6, 'https://leetcode.com/problems/find-the-city-with-the-smallest-number-of-neighbors-at-a-threshold-distance/', 2, 22),
(128, 'Copy List with Random Pointer', 'MEDIUM', 6, 'https://leetcode.com/problems/copy-list-with-random-pointer/', 3, 22),
(129, 'Clone N-ary Tree', 'MEDIUM', 6, 'https://leetcode.com/problems/clone-n-ary-tree/', 4, 22),

-- Pattern 23: Dijkstra
(130, 'Network Delay Time', 'MEDIUM', 6, 'https://leetcode.com/problems/network-delay-time/', 1, 23),
(131, 'Swim in Rising Water', 'HARD', 9, 'https://leetcode.com/problems/swim-in-rising-water/', 2, 23),
(132, 'Path with Maximum Probability', 'MEDIUM', 6, 'https://leetcode.com/problems/path-with-maximum-probability/', 3, 23),
(133, 'Path With Minimum Effort', 'MEDIUM', 6, 'https://leetcode.com/problems/path-with-minimum-effort/', 4, 23),
(134, 'Number of Ways to Arrive at Destination', 'MEDIUM', 6, 'https://leetcode.com/problems/number-of-ways-to-arrive-at-destination/', 5, 23),
(135, 'Second Minimum Time to Reach Destination', 'HARD', 9, 'https://leetcode.com/problems/second-minimum-time-to-reach-destination/', 6, 23),
(136, 'Minimum Weighted Subgraph With Required Paths', 'HARD', 9, 'https://leetcode.com/problems/minimum-weighted-subgraph-with-the-required-paths/', 7, 23),
(137, 'Minimum Obstacle Removal to Reach Corner', 'HARD', 9, 'https://leetcode.com/problems/minimum-obstacle-removal-to-reach-corner/', 8, 23),
(138, 'Minimum Time to Visit a Cell In a Grid', 'HARD', 9, 'https://leetcode.com/problems/minimum-time-to-visit-a-cell-in-a-grid/', 9, 23),
(139, 'Find the Safest Path in a Grid', 'HARD', 9, 'https://leetcode.com/problems/find-the-safest-path-in-a-grid/', 10, 23),

-- Pattern 24: Bellman-Ford / BFS+K
(140, 'Cheapest Flights Within K Stops', 'MEDIUM', 6, 'https://leetcode.com/problems/cheapest-flights-within-k-stops/', 1, 24),
(141, 'Shortest Path with Alternating Colors', 'MEDIUM', 6, 'https://leetcode.com/problems/shortest-path-with-alternating-colors/', 2, 24),

-- Pattern 25: Union-Find
(142, 'Number of Islands', 'MEDIUM', 6, 'https://leetcode.com/problems/number-of-islands/', 1, 25),
(143, 'Graph Valid Tree', 'MEDIUM', 6, 'https://leetcode.com/problems/graph-valid-tree/', 2, 25),
(144, 'Number of Islands II', 'HARD', 9, 'https://leetcode.com/problems/number-of-islands-ii/', 3, 25),
(145, 'Number of Connected Components in an Undirected Graph', 'MEDIUM', 6, 'https://leetcode.com/problems/number-of-connected-components-in-an-undirected-graph/', 4, 25),
(146, 'Number of Provinces', 'MEDIUM', 6, 'https://leetcode.com/problems/number-of-provinces/', 5, 25),
(147, 'Redundant Connection', 'MEDIUM', 6, 'https://leetcode.com/problems/redundant-connection/', 6, 25),
(148, 'Accounts Merge', 'MEDIUM', 6, 'https://leetcode.com/problems/accounts-merge/', 7, 25),
(149, 'Sentence Similarity II', 'MEDIUM', 6, 'https://leetcode.com/problems/sentence-similarity-ii/', 8, 25),
(150, 'Most Stones Removed with Same Row or Column', 'MEDIUM', 6, 'https://leetcode.com/problems/most-stones-removed-with-same-row-or-column/', 9, 25),
(151, 'Largest Component Size by Common Factor', 'HARD', 9, 'https://leetcode.com/problems/largest-component-size-by-common-factor/', 10, 25),
(152, 'Regions Cut By Slashes', 'MEDIUM', 6, 'https://leetcode.com/problems/regions-cut-by-slashes/', 11, 25),
(153, 'Earliest Moment When Everyone Become Friends', 'MEDIUM', 6, 'https://leetcode.com/problems/the-earliest-moment-when-everyone-become-friends/', 12, 25),

-- Pattern 26: Strongly Connected Components
(154, 'Course Schedule II', 'MEDIUM', 6, 'https://leetcode.com/problems/course-schedule-ii/', 1, 26),
(155, 'Number of Provinces', 'MEDIUM', 6, 'https://leetcode.com/problems/number-of-provinces/', 2, 26),
(156, 'Critical Connections in a Network', 'HARD', 9, 'https://leetcode.com/problems/critical-connections-in-a-network/', 3, 26),
(157, 'Maximum Employees to Be Invited to a Meeting', 'HARD', 9, 'https://leetcode.com/problems/maximum-employees-to-be-invited-to-a-meeting/', 4, 26),

-- Pattern 27: Bridges & Articulation Points
(158, 'Critical Connections in a Network', 'HARD', 9, 'https://leetcode.com/problems/critical-connections-in-a-network/', 1, 27),
(159, 'Longest Cycle in a Graph', 'HARD', 9, 'https://leetcode.com/problems/longest-cycle-in-a-graph/', 2, 27),

-- Pattern 28: Minimum Spanning Tree
(160, 'Connecting Cities With Minimum Cost', 'MEDIUM', 6, 'https://leetcode.com/problems/connecting-cities-with-minimum-cost/', 1, 28),
(161, 'Min Cost to Connect All Points', 'MEDIUM', 6, 'https://leetcode.com/problems/min-cost-to-connect-all-points/', 2, 28),
(162, 'Optimize Water Distribution in a Village', 'HARD', 9, 'https://leetcode.com/problems/optimize-water-distribution-in-a-village/', 3, 28),
(163, 'Find Critical and Pseudo-Critical Edges in MST', 'HARD', 9, 'https://leetcode.com/problems/find-critical-and-pseudo-critical-edges-in-minimum-spanning-tree/', 4, 28),

-- Pattern 29: Bidirectional BFS
(164, 'Word Ladder', 'HARD', 9, 'https://leetcode.com/problems/word-ladder/', 1, 29),
(165, 'Word Ladder II', 'HARD', 9, 'https://leetcode.com/problems/word-ladder-ii/', 2, 29),
(166, 'Bus Routes', 'HARD', 9, 'https://leetcode.com/problems/bus-routes/', 3, 29);

INSERT INTO problems
(id, title, difficulty, difficulty_score, leetcode_url, order_index, pattern_id)
VALUES

-- Pattern 30: Fibonacci Style
(167, 'Climbing Stairs', 'EASY', 3, 'https://leetcode.com/problems/climbing-stairs/', 1, 30),
(168, 'Decode Ways', 'MEDIUM', 6, 'https://leetcode.com/problems/decode-ways/', 2, 30),
(169, 'House Robber', 'MEDIUM', 6, 'https://leetcode.com/problems/house-robber/', 3, 30),
(170, 'House Robber II', 'MEDIUM', 6, 'https://leetcode.com/problems/house-robber-ii/', 4, 30),
(171, 'House Robber III', 'MEDIUM', 6, 'https://leetcode.com/problems/house-robber-iii/', 5, 30),
(172, 'Fibonacci Number', 'EASY', 3, 'https://leetcode.com/problems/fibonacci-number/', 6, 30),
(173, 'Delete and Earn', 'MEDIUM', 6, 'https://leetcode.com/problems/delete-and-earn/', 7, 30),
(174, 'Min Cost Climbing Stairs', 'EASY', 3, 'https://leetcode.com/problems/min-cost-climbing-stairs/', 8, 30),

-- Pattern 31: Kadane Style
(175, 'Maximum Subarray', 'MEDIUM', 6, 'https://leetcode.com/problems/maximum-subarray/', 1, 31),
(176, 'Maximum Sum Circular Subarray', 'MEDIUM', 6, 'https://leetcode.com/problems/maximum-sum-circular-subarray/', 2, 31),
(177, 'Maximum Score Of Spliced Array', 'HARD', 9, 'https://leetcode.com/problems/maximum-score-of-spliced-array/', 3, 31),
(178, 'Maximum Absolute Sum of Any Subarray', 'MEDIUM', 6, 'https://leetcode.com/problems/maximum-absolute-sum-of-any-subarray/', 4, 31),
(179, 'Maximum Product Subarray', 'MEDIUM', 6, 'https://leetcode.com/problems/maximum-product-subarray/', 5, 31),

-- Pattern 32: Coin Change / Unbounded
(180, 'Coin Change', 'MEDIUM', 6, 'https://leetcode.com/problems/coin-change/', 1, 32),
(181, 'Combination Sum IV', 'MEDIUM', 6, 'https://leetcode.com/problems/combination-sum-iv/', 2, 32),
(182, 'Coin Change II', 'MEDIUM', 6, 'https://leetcode.com/problems/coin-change-ii/', 3, 32),

-- Pattern 33: 0/1 Knapsack
(183, 'Partition Equal Subset Sum', 'MEDIUM', 6, 'https://leetcode.com/problems/partition-equal-subset-sum/', 1, 33),
(184, 'Target Sum', 'MEDIUM', 6, 'https://leetcode.com/problems/target-sum/', 2, 33),

-- Pattern 34: Word Break
(185, 'Word Break', 'MEDIUM', 6, 'https://leetcode.com/problems/word-break/', 1, 34),
(186, 'Word Break II', 'HARD', 9, 'https://leetcode.com/problems/word-break-ii/', 2, 34),

-- Pattern 35: LCS
(187, 'Longest Common Subsequence', 'MEDIUM', 6, 'https://leetcode.com/problems/longest-common-subsequence/', 1, 35),
(188, 'Shortest Common Supersequence', 'HARD', 9, 'https://leetcode.com/problems/shortest-common-supersequence/', 2, 35),
(189, 'Minimum Insertion Steps to Make a String Palindrome', 'HARD', 9, 'https://leetcode.com/problems/minimum-insertion-steps-to-make-a-string-palindrome/', 3, 35),

-- Pattern 36: Edit Distance
(190, 'Edit Distance', 'HARD', 9, 'https://leetcode.com/problems/edit-distance/', 1, 36),
(191, 'Delete Operation for Two Strings', 'MEDIUM', 6, 'https://leetcode.com/problems/delete-operation-for-two-strings/', 2, 36),
(192, 'Minimum ASCII Delete Sum for Two Strings', 'MEDIUM', 6, 'https://leetcode.com/problems/minimum-ascii-delete-sum-for-two-strings/', 3, 36),

-- Pattern 37: Unique Paths
(193, 'Unique Paths', 'MEDIUM', 6, 'https://leetcode.com/problems/unique-paths/', 1, 37),
(194, 'Unique Paths II', 'MEDIUM', 6, 'https://leetcode.com/problems/unique-paths-ii/', 2, 37),
(195, 'Minimum Path Sum', 'MEDIUM', 6, 'https://leetcode.com/problems/minimum-path-sum/', 3, 37),
(196, 'Triangle', 'MEDIUM', 6, 'https://leetcode.com/problems/triangle/', 4, 37),
(197, 'Maximal Square', 'MEDIUM', 6, 'https://leetcode.com/problems/maximal-square/', 5, 37),
(198, 'Minimum Falling Path Sum', 'MEDIUM', 6, 'https://leetcode.com/problems/minimum-falling-path-sum/', 6, 37),
(199, 'Count Square Submatrices with All Ones', 'MEDIUM', 6, 'https://leetcode.com/problems/count-square-submatrices-with-all-ones/', 7, 37),

-- Pattern 38: Interval DP
(200, 'Burst Balloons', 'HARD', 9, 'https://leetcode.com/problems/burst-balloons/', 1, 38),
(201, 'Remove Boxes', 'HARD', 9, 'https://leetcode.com/problems/remove-boxes/', 2, 38),

-- Pattern 39: Catalan Numbers
(202, 'Unique Binary Search Trees II', 'MEDIUM', 6, 'https://leetcode.com/problems/unique-binary-search-trees-ii/', 1, 39),
(203, 'Unique Binary Search Trees', 'MEDIUM', 6, 'https://leetcode.com/problems/unique-binary-search-trees/', 2, 39),
(204, 'Different Ways to Add Parentheses', 'MEDIUM', 6, 'https://leetcode.com/problems/different-ways-to-add-parentheses/', 3, 39),

-- Pattern 40: LIS
(205, 'Longest Increasing Subsequence', 'MEDIUM', 6, 'https://leetcode.com/problems/longest-increasing-subsequence/', 1, 40),
(206, 'Russian Doll Envelopes', 'HARD', 9, 'https://leetcode.com/problems/russian-doll-envelopes/', 2, 40),
(207, 'Minimum Number of Removals to Make Mountain Array', 'HARD', 9, 'https://leetcode.com/problems/minimum-number-of-removals-to-make-mountain-array/', 3, 40),
(208, 'Longest Increasing Subsequence II', 'HARD', 9, 'https://leetcode.com/problems/longest-increasing-subsequence-ii/', 4, 40),

-- Pattern 41: Stock Problems
(209, 'Best Time to Buy and Sell Stock', 'EASY', 3, 'https://leetcode.com/problems/best-time-to-buy-and-sell-stock/', 1, 41),
(210, 'Best Time to Buy and Sell Stock II', 'MEDIUM', 6, 'https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/', 2, 41),
(211, 'Best Time to Buy and Sell Stock III', 'HARD', 9, 'https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iii/', 3, 41),
(212, 'Best Time to Buy and Sell Stock IV', 'HARD', 9, 'https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iv/', 4, 41),
(213, 'Best Time to Buy and Sell Stock with Cooldown', 'MEDIUM', 6, 'https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/', 5, 41);

INSERT INTO problems
(id, title, difficulty, difficulty_score, leetcode_url, order_index, pattern_id)
VALUES

-- Pattern 42: Top K Elements
(214, 'Kth Largest Element in an Array', 'MEDIUM', 6, 'https://leetcode.com/problems/kth-largest-element-in-an-array/', 1, 42),
(215, 'Top K Frequent Elements', 'MEDIUM', 6, 'https://leetcode.com/problems/top-k-frequent-elements/', 2, 42),
(216, 'Sort Characters By Frequency', 'MEDIUM', 6, 'https://leetcode.com/problems/sort-characters-by-frequency/', 3, 42),
(217, 'Relative Ranks', 'EASY', 3, 'https://leetcode.com/problems/relative-ranks/', 4, 42),
(218, 'Kth Largest Element in a Stream', 'EASY', 3, 'https://leetcode.com/problems/kth-largest-element-in-a-stream/', 5, 42),
(219, 'K Closest Points to Origin', 'MEDIUM', 6, 'https://leetcode.com/problems/k-closest-points-to-origin/', 6, 42),
(220, 'Last Stone Weight', 'EASY', 3, 'https://leetcode.com/problems/last-stone-weight/', 7, 42),
(221, 'Take Gifts From the Richest Pile', 'EASY', 3, 'https://leetcode.com/problems/take-gifts-from-the-richest-pile/', 8, 42),

-- Pattern 43: Two Heaps
(222, 'Find Median from Data Stream', 'HARD', 9, 'https://leetcode.com/problems/find-median-from-data-stream/', 1, 43),
(223, 'Finding MK Average', 'HARD', 9, 'https://leetcode.com/problems/finding-mk-average/', 2, 43),

-- Pattern 44: K-way Merge
(224, 'Merge k Sorted Lists', 'HARD', 9, 'https://leetcode.com/problems/merge-k-sorted-lists/', 1, 44),
(225, 'Find K Pairs with Smallest Sums', 'MEDIUM', 6, 'https://leetcode.com/problems/find-k-pairs-with-smallest-sums/', 2, 44),
(226, 'Kth Smallest Element in a Sorted Matrix', 'MEDIUM', 6, 'https://leetcode.com/problems/kth-smallest-element-in-a-sorted-matrix/', 3, 44),
(227, 'Smallest Range Covering Elements from K Lists', 'HARD', 9, 'https://leetcode.com/problems/smallest-range-covering-elements-from-k-lists/', 4, 44),

-- Pattern 45: Scheduling / Minimum Cost
(228, 'Meeting Rooms II', 'MEDIUM', 6, 'https://leetcode.com/problems/meeting-rooms-ii/', 1, 45),
(229, 'Reorganize String', 'MEDIUM', 6, 'https://leetcode.com/problems/reorganize-string/', 2, 45),
(230, 'Minimum Cost to Hire K Workers', 'HARD', 9, 'https://leetcode.com/problems/minimum-cost-to-hire-k-workers/', 3, 45),
(231, 'Furthest Building You Can Reach', 'MEDIUM', 6, 'https://leetcode.com/problems/furthest-building-you-can-reach/', 4, 45),
(232, 'Maximum Average Pass Ratio', 'MEDIUM', 6, 'https://leetcode.com/problems/maximum-average-pass-ratio/', 5, 45),
(233, 'Single-Threaded CPU', 'MEDIUM', 6, 'https://leetcode.com/problems/single-threaded-cpu/', 6, 45),
(234, 'The Number of the Smallest Unoccupied Chair', 'MEDIUM', 6, 'https://leetcode.com/problems/the-number-of-the-smallest-unoccupied-chair/', 7, 45),
(235, 'Meeting Rooms III', 'HARD', 9, 'https://leetcode.com/problems/meeting-rooms-iii/', 8, 45),

-- Pattern 46: Subsets
(236, 'Letter Combinations of a Phone Number', 'MEDIUM', 6, 'https://leetcode.com/problems/letter-combinations-of-a-phone-number/', 1, 46),
(237, 'Combinations', 'MEDIUM', 6, 'https://leetcode.com/problems/combinations/', 2, 46),
(238, 'Subsets', 'MEDIUM', 6, 'https://leetcode.com/problems/subsets/', 3, 46),
(239, 'Subsets II', 'MEDIUM', 6, 'https://leetcode.com/problems/subsets-ii/', 4, 46),

-- Pattern 47: Permutations
(240, 'Next Permutation', 'MEDIUM', 6, 'https://leetcode.com/problems/next-permutation/', 1, 47),
(241, 'Permutations', 'MEDIUM', 6, 'https://leetcode.com/problems/permutations/', 2, 47),
(242, 'Permutation Sequence', 'HARD', 9, 'https://leetcode.com/problems/permutation-sequence/', 3, 47),

-- Pattern 48: Combination Sum
(243, 'Combination Sum', 'MEDIUM', 6, 'https://leetcode.com/problems/combination-sum/', 1, 48),
(244, 'Combination Sum II', 'MEDIUM', 6, 'https://leetcode.com/problems/combination-sum-ii/', 2, 48),

-- Pattern 49: Parentheses Generation
(245, 'Generate Parentheses', 'MEDIUM', 6, 'https://leetcode.com/problems/generate-parentheses/', 1, 49),
(246, 'Remove Invalid Parentheses', 'HARD', 9, 'https://leetcode.com/problems/remove-invalid-parentheses/', 2, 49),

-- Pattern 50: Word Search / Grid
(247, 'Word Search', 'MEDIUM', 6, 'https://leetcode.com/problems/word-search/', 1, 50),
(248, 'Word Search II', 'HARD', 9, 'https://leetcode.com/problems/word-search-ii/', 2, 50),
(249, 'Check if Word Can Be Placed In Crossword', 'MEDIUM', 6, 'https://leetcode.com/problems/check-if-word-can-be-placed-in-crossword/', 3, 50),

-- Pattern 51: N-Queens / Constraint
(250, 'Sudoku Solver', 'HARD', 9, 'https://leetcode.com/problems/sudoku-solver/', 1, 51),
(251, 'N-Queens', 'HARD', 9, 'https://leetcode.com/problems/n-queens/', 2, 51),

-- Pattern 52: Palindrome Partitioning
(252, 'Palindrome Partitioning', 'MEDIUM', 6, 'https://leetcode.com/problems/palindrome-partitioning/', 1, 52),
(253, 'Palindrome Partitioning II', 'HARD', 9, 'https://leetcode.com/problems/palindrome-partitioning-ii/', 2, 52),
(254, 'Pseudo-Palindromic Paths in a Binary Tree', 'MEDIUM', 6, 'https://leetcode.com/problems/pseudo-palindromic-paths-in-a-binary-tree/', 3, 52),

-- Pattern 53: Interval Merging/Scheduling
(255, 'Merge Intervals', 'MEDIUM', 6, 'https://leetcode.com/problems/merge-intervals/', 1, 53),
(256, 'Insert Interval', 'MEDIUM', 6, 'https://leetcode.com/problems/insert-interval/', 2, 53),
(257, 'Employee Free Time', 'HARD', 9, 'https://leetcode.com/problems/employee-free-time/', 3, 53),
(258, 'Interval List Intersections', 'MEDIUM', 6, 'https://leetcode.com/problems/interval-list-intersections/', 4, 53),
(259, 'Divide Intervals Into Minimum Number of Groups', 'MEDIUM', 6, 'https://leetcode.com/problems/divide-intervals-into-minimum-number-of-groups/', 5, 53),

-- Pattern 54: Jump Game
(260, 'Jump Game II', 'MEDIUM', 6, 'https://leetcode.com/problems/jump-game-ii/', 1, 54),
(261, 'Jump Game', 'MEDIUM', 6, 'https://leetcode.com/problems/jump-game/', 2, 54),

-- Pattern 55: Buy/Sell Stock
(262, 'Best Time to Buy and Sell Stock', 'EASY', 3, 'https://leetcode.com/problems/best-time-to-buy-and-sell-stock/', 1, 55),
(263, 'Best Time to Buy and Sell Stock II', 'MEDIUM', 6, 'https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/', 2, 55),

-- Pattern 56: Gas Station
(264, 'Gas Station', 'MEDIUM', 6, 'https://leetcode.com/problems/gas-station/', 1, 56),
(265, 'Maximize the Topmost Element After K Moves', 'MEDIUM', 6, 'https://leetcode.com/problems/maximize-the-topmost-element-after-k-moves/', 2, 56),

-- Pattern 57: Task Scheduling
(266, 'Task Scheduler', 'MEDIUM', 6, 'https://leetcode.com/problems/task-scheduler/', 1, 57),
(267, 'Reorganize String', 'MEDIUM', 6, 'https://leetcode.com/problems/reorganize-string/', 2, 57),
(268, 'Distant Barcodes', 'MEDIUM', 6, 'https://leetcode.com/problems/distant-barcodes/', 3, 57),

-- Pattern 58: Sorting Based
(269, 'Assign Cookies', 'EASY', 3, 'https://leetcode.com/problems/assign-cookies/', 1, 58),
(270, 'Candy', 'HARD', 9, 'https://leetcode.com/problems/candy/', 2, 58),
(271, 'Queue Reconstruction by Height', 'MEDIUM', 6, 'https://leetcode.com/problems/queue-reconstruction-by-height/', 3, 58),
(272, 'Two City Scheduling', 'MEDIUM', 6, 'https://leetcode.com/problems/two-city-scheduling/', 4, 58);

INSERT INTO problems
(id, title, difficulty, difficulty_score, leetcode_url, order_index, pattern_id)
VALUES

-- Pattern 59: Sorted Array/List
(273, 'Search Insert Position', 'EASY', 3, 'https://leetcode.com/problems/search-insert-position/', 1, 59),
(274, 'Sqrt(x)', 'EASY', 3, 'https://leetcode.com/problems/sqrtx/', 2, 59),
(275, 'Search a 2D Matrix', 'MEDIUM', 6, 'https://leetcode.com/problems/search-a-2d-matrix/', 3, 59),
(276, 'First Bad Version', 'EASY', 3, 'https://leetcode.com/problems/first-bad-version/', 4, 59),
(277, 'Guess Number Higher or Lower', 'EASY', 3, 'https://leetcode.com/problems/guess-number-higher-or-lower/', 5, 59),
(278, 'Single Element in a Sorted Array', 'MEDIUM', 6, 'https://leetcode.com/problems/single-element-in-a-sorted-array/', 6, 59),
(279, 'Binary Search', 'EASY', 3, 'https://leetcode.com/problems/binary-search/', 7, 59),
(280, 'Kth Missing Positive Number', 'EASY', 3, 'https://leetcode.com/problems/kth-missing-positive-number/', 8, 59),

-- Pattern 60: Rotated / Peak
(281, 'Search in Rotated Sorted Array', 'MEDIUM', 6, 'https://leetcode.com/problems/search-in-rotated-sorted-array/', 1, 60),
(282, 'Search in Rotated Sorted Array II', 'MEDIUM', 6, 'https://leetcode.com/problems/search-in-rotated-sorted-array-ii/', 2, 60),
(283, 'Find Minimum in Rotated Sorted Array', 'MEDIUM', 6, 'https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/', 3, 60),
(284, 'Find Peak Element', 'MEDIUM', 6, 'https://leetcode.com/problems/find-peak-element/', 4, 60),
(285, 'Peak Index in a Mountain Array', 'MEDIUM', 6, 'https://leetcode.com/problems/peak-index-in-a-mountain-array/', 5, 60),
(286, 'Find in Mountain Array', 'HARD', 9, 'https://leetcode.com/problems/find-in-mountain-array/', 6, 60),

-- Pattern 61: Binary Search on Answer
(287, 'Split Array Largest Sum', 'HARD', 9, 'https://leetcode.com/problems/split-array-largest-sum/', 1, 61),
(288, 'Minimize Max Distance to Gas Station', 'HARD', 9, 'https://leetcode.com/problems/minimize-max-distance-to-gas-station/', 2, 61),
(289, 'Koko Eating Bananas', 'MEDIUM', 6, 'https://leetcode.com/problems/koko-eating-bananas/', 3, 61),
(290, 'Capacity To Ship Packages Within D Days', 'MEDIUM', 6, 'https://leetcode.com/problems/capacity-to-ship-packages-within-d-days/', 4, 61),
(291, 'Minimum Number of Days to Make m Bouquets', 'MEDIUM', 6, 'https://leetcode.com/problems/minimum-number-of-days-to-make-m-bouquets/', 5, 61),
(292, 'Minimum Limit of Balls in a Bag', 'MEDIUM', 6, 'https://leetcode.com/problems/minimum-limit-of-balls-in-a-bag/', 6, 61),
(293, 'Minimized Maximum of Products Distributed to Any Store', 'MEDIUM', 6, 'https://leetcode.com/problems/minimized-maximum-of-products-distributed-to-any-store/', 7, 61),
(294, 'Maximum Candies Allocated to K Children', 'MEDIUM', 6, 'https://leetcode.com/problems/maximum-candies-allocated-to-k-children/', 8, 61),

-- Pattern 62: First/Last Occurrence
(295, 'Find First and Last Position of Element in Sorted Array', 'MEDIUM', 6, 'https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/', 1, 62),
(296, 'Find K Closest Elements', 'MEDIUM', 6, 'https://leetcode.com/problems/find-k-closest-elements/', 2, 62),

-- Pattern 63: Median / Kth Across Arrays
(297, 'Median of Two Sorted Arrays', 'HARD', 9, 'https://leetcode.com/problems/median-of-two-sorted-arrays/', 1, 63),
(298, 'Find K-th Smallest Pair Distance', 'HARD', 9, 'https://leetcode.com/problems/find-k-th-smallest-pair-distance/', 2, 63),
(299, 'Kth Smallest Element in a Sorted Matrix', 'MEDIUM', 6, 'https://leetcode.com/problems/kth-smallest-element-in-a-sorted-matrix/', 3, 63),

-- Pattern 64: Valid Parentheses
(300, 'Valid Parentheses', 'EASY', 3, 'https://leetcode.com/problems/valid-parentheses/', 1, 64),
(301, 'Longest Valid Parentheses', 'HARD', 9, 'https://leetcode.com/problems/longest-valid-parentheses/', 2, 64),
(302, 'Minimum Add to Make Parentheses Valid', 'MEDIUM', 6, 'https://leetcode.com/problems/minimum-add-to-make-parentheses-valid/', 3, 64),
(303, 'Minimum Remove to Make Valid Parentheses', 'MEDIUM', 6, 'https://leetcode.com/problems/minimum-remove-to-make-valid-parentheses/', 4, 64),
(304, 'Minimum Number of Swaps to Make the String Balanced', 'MEDIUM', 6, 'https://leetcode.com/problems/minimum-number-of-swaps-to-make-the-string-balanced/', 5, 64),

-- Pattern 65: Monotonic Stack
(305, 'Remove K Digits', 'MEDIUM', 6, 'https://leetcode.com/problems/remove-k-digits/', 1, 65),
(306, 'Next Greater Element I', 'EASY', 3, 'https://leetcode.com/problems/next-greater-element-i/', 2, 65),
(307, 'Next Greater Element II', 'MEDIUM', 6, 'https://leetcode.com/problems/next-greater-element-ii/', 3, 65),
(308, 'Daily Temperatures', 'MEDIUM', 6, 'https://leetcode.com/problems/daily-temperatures/', 4, 65),
(309, 'Online Stock Span', 'MEDIUM', 6, 'https://leetcode.com/problems/online-stock-span/', 5, 65),
(310, 'Sum of Subarray Minimums', 'MEDIUM', 6, 'https://leetcode.com/problems/sum-of-subarray-minimums/', 6, 65),
(311, 'Maximum Width Ramp', 'MEDIUM', 6, 'https://leetcode.com/problems/maximum-width-ramp/', 7, 65),
(312, 'Final Prices With a Special Discount in a Shop', 'EASY', 3, 'https://leetcode.com/problems/final-prices-with-a-special-discount-in-a-shop/', 8, 65),
(313, 'Find the Most Competitive Subsequence', 'MEDIUM', 6, 'https://leetcode.com/problems/find-the-most-competitive-subsequence/', 9, 65),

-- Pattern 66: Expression Evaluation
(314, 'Evaluate Reverse Polish Notation', 'MEDIUM', 6, 'https://leetcode.com/problems/evaluate-reverse-polish-notation/', 1, 66),
(315, 'Basic Calculator', 'HARD', 9, 'https://leetcode.com/problems/basic-calculator/', 2, 66),
(316, 'Basic Calculator II', 'MEDIUM', 6, 'https://leetcode.com/problems/basic-calculator-ii/', 3, 66),
(317, 'Basic Calculator III', 'HARD', 9, 'https://leetcode.com/problems/basic-calculator-iii/', 4, 66),

-- Pattern 67: Simulation
(318, 'Simplify Path', 'MEDIUM', 6, 'https://leetcode.com/problems/simplify-path/', 1, 67),
(319, 'Decode String', 'MEDIUM', 6, 'https://leetcode.com/problems/decode-string/', 2, 67),
(320, 'Asteroid Collision', 'MEDIUM', 6, 'https://leetcode.com/problems/asteroid-collision/', 3, 67),

-- Pattern 68: Stack Design
(321, 'Min Stack', 'MEDIUM', 6, 'https://leetcode.com/problems/min-stack/', 1, 68),
(322, 'Maximum Frequency Stack', 'HARD', 9, 'https://leetcode.com/problems/maximum-frequency-stack/', 2, 68),
(323, 'Online Stock Span', 'MEDIUM', 6, 'https://leetcode.com/problems/online-stock-span/', 3, 68),

-- Pattern 69: Largest Rectangle
(324, 'Largest Rectangle in Histogram', 'HARD', 9, 'https://leetcode.com/problems/largest-rectangle-in-histogram/', 1, 69),
(325, 'Maximal Rectangle', 'HARD', 9, 'https://leetcode.com/problems/maximal-rectangle/', 2, 69);

INSERT INTO problems
(id, title, difficulty, difficulty_score, leetcode_url, order_index, pattern_id)
VALUES

-- Pattern 70: Bitwise XOR
(326, 'Single Number', 'EASY', 3, 'https://leetcode.com/problems/single-number/', 1, 70),
(327, 'Single Number II', 'MEDIUM', 6, 'https://leetcode.com/problems/single-number-ii/', 2, 70),
(328, 'Missing Number', 'EASY', 3, 'https://leetcode.com/problems/missing-number/', 3, 70),
(329, 'Find the Difference', 'EASY', 3, 'https://leetcode.com/problems/find-the-difference/', 4, 70),

-- Pattern 71: Counting Set Bits
(330, 'Number of 1 Bits', 'EASY', 3, 'https://leetcode.com/problems/number-of-1-bits/', 1, 71),
(331, 'Power of Two', 'EASY', 3, 'https://leetcode.com/problems/power-of-two/', 2, 71),
(332, 'Total Hamming Distance', 'MEDIUM', 6, 'https://leetcode.com/problems/total-hamming-distance/', 3, 71),

-- Pattern 72: Bitwise DP
(333, 'Counting Bits', 'EASY', 3, 'https://leetcode.com/problems/counting-bits/', 1, 72),
(334, 'Parallel Courses II', 'HARD', 9, 'https://leetcode.com/problems/parallel-courses-ii/', 2, 72),
(335, 'Count Triplets That Can Form Two Arrays of Equal XOR', 'MEDIUM', 6, 'https://leetcode.com/problems/count-triplets-that-can-form-two-arrays-of-equal-xor/', 3, 72),

-- Pattern 73: Power of Two/Four
(336, 'Power of Two', 'EASY', 3, 'https://leetcode.com/problems/power-of-two/', 1, 73),
(337, 'Power of Four', 'EASY', 3, 'https://leetcode.com/problems/power-of-four/', 2, 73);


INSERT INTO problems
(id, title, difficulty, difficulty_score, leetcode_url, order_index, pattern_id)
VALUES

-- Pattern 74: In-place Reversal
(338, 'Remove Duplicates from Sorted List', 'EASY', 3, 'https://leetcode.com/problems/remove-duplicates-from-sorted-list/', 1, 74),
(339, 'Reverse Linked List II', 'MEDIUM', 6, 'https://leetcode.com/problems/reverse-linked-list-ii/', 2, 74),
(340, 'Reverse Linked List', 'EASY', 3, 'https://leetcode.com/problems/reverse-linked-list/', 3, 74),
(341, 'Reverse Nodes in k-Group', 'HARD', 9, 'https://leetcode.com/problems/reverse-nodes-in-k-group/', 4, 74),
(342, 'Palindrome Linked List', 'EASY', 3, 'https://leetcode.com/problems/palindrome-linked-list/', 5, 74),
(343, 'Remove Duplicates from Sorted List II', 'MEDIUM', 6, 'https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/', 6, 74),

-- Pattern 75: Merge Sorted Lists
(344, 'Merge Two Sorted Lists', 'EASY', 3, 'https://leetcode.com/problems/merge-two-sorted-lists/', 1, 75),
(345, 'Merge k Sorted Lists', 'HARD', 9, 'https://leetcode.com/problems/merge-k-sorted-lists/', 2, 75),

-- Pattern 76: Addition of Numbers
(346, 'Add Two Numbers', 'MEDIUM', 6, 'https://leetcode.com/problems/add-two-numbers/', 1, 76),
(347, 'Plus One Linked List', 'MEDIUM', 6, 'https://leetcode.com/problems/plus-one-linked-list/', 2, 76),

-- Pattern 77: Intersection Detection
(348, 'Intersection of Two Linked Lists', 'EASY', 3, 'https://leetcode.com/problems/intersection-of-two-linked-lists/', 1, 77),
(349, 'Minimum Index Sum of Two Lists', 'EASY', 3, 'https://leetcode.com/problems/minimum-index-sum-of-two-lists/', 2, 77),

-- Pattern 78: Reordering / Partitioning
(350, 'Swap Nodes in Pairs', 'MEDIUM', 6, 'https://leetcode.com/problems/swap-nodes-in-pairs/', 1, 78),
(351, 'Rotate List', 'MEDIUM', 6, 'https://leetcode.com/problems/rotate-list/', 2, 78),
(352, 'Partition List', 'MEDIUM', 6, 'https://leetcode.com/problems/partition-list/', 3, 78),
(353, 'Reorder List', 'MEDIUM', 6, 'https://leetcode.com/problems/reorder-list/', 4, 78),
(354, 'Odd Even Linked List', 'MEDIUM', 6, 'https://leetcode.com/problems/odd-even-linked-list/', 5, 78);

INSERT INTO problems
(id, title, difficulty, difficulty_score, leetcode_url, order_index, pattern_id)
VALUES

-- Pattern 79: In-place Rotation
(355, 'Rotate Image', 'MEDIUM', 6, 'https://leetcode.com/problems/rotate-image/', 1, 79),
(356, 'Rotate Array', 'MEDIUM', 6, 'https://leetcode.com/problems/rotate-array/', 2, 79),
(357, 'Transpose Matrix', 'EASY', 3, 'https://leetcode.com/problems/transpose-matrix/', 3, 79),

-- Pattern 80: Spiral Traversal
(358, 'Spiral Matrix', 'MEDIUM', 6, 'https://leetcode.com/problems/spiral-matrix/', 1, 80),
(359, 'Spiral Matrix II', 'MEDIUM', 6, 'https://leetcode.com/problems/spiral-matrix-ii/', 2, 80),
(360, 'Spiral Matrix III', 'MEDIUM', 6, 'https://leetcode.com/problems/spiral-matrix-iii/', 3, 80),
(361, 'Spiral Matrix IV', 'MEDIUM', 6, 'https://leetcode.com/problems/spiral-matrix-iv/', 4, 80),

-- Pattern 81: Set Matrix Zeroes
(362, 'Set Matrix Zeroes', 'MEDIUM', 6, 'https://leetcode.com/problems/set-matrix-zeroes/', 1, 81),
(363, 'Game of Life', 'MEDIUM', 6, 'https://leetcode.com/problems/game-of-life/', 2, 81),
(364, 'Diagonal Traverse', 'MEDIUM', 6, 'https://leetcode.com/problems/diagonal-traverse/', 3, 81),

-- Pattern 82: Product Except Self
(365, 'Product of Array Except Self', 'MEDIUM', 6, 'https://leetcode.com/problems/product-of-array-except-self/', 1, 82),
(366, 'Longest Mountain in Array', 'MEDIUM', 6, 'https://leetcode.com/problems/longest-mountain-in-array/', 2, 82),
(367, 'Minimum Penalty for a Shop', 'MEDIUM', 6, 'https://leetcode.com/problems/minimum-penalty-for-a-shop/', 3, 82),

-- Pattern 83: Plus One / Carry
(368, 'Plus One', 'EASY', 3, 'https://leetcode.com/problems/plus-one/', 1, 83),
(369, 'Multiply Strings', 'MEDIUM', 6, 'https://leetcode.com/problems/multiply-strings/', 2, 83),
(370, 'Add to Array-Form of Integer', 'EASY', 3, 'https://leetcode.com/problems/add-to-array-form-of-integer/', 3, 83),
(371, 'Add Binary', 'EASY', 3, 'https://leetcode.com/problems/add-binary/', 4, 83),

-- Pattern 84: Merge Sorted Array
(372, 'Merge Sorted Array', 'EASY', 3, 'https://leetcode.com/problems/merge-sorted-array/', 1, 84),
(373, 'Squares of a Sorted Array', 'EASY', 3, 'https://leetcode.com/problems/squares-of-a-sorted-array/', 2, 84),

-- Pattern 85: Cyclic Sort
(374, 'First Missing Positive', 'HARD', 9, 'https://leetcode.com/problems/first-missing-positive/', 1, 85),
(375, 'Missing Number', 'EASY', 3, 'https://leetcode.com/problems/missing-number/', 2, 85),
(376, 'Find the Duplicate Number', 'MEDIUM', 6, 'https://leetcode.com/problems/find-the-duplicate-number/', 3, 85),
(377, 'Find All Duplicates in an Array', 'MEDIUM', 6, 'https://leetcode.com/problems/find-all-duplicates-in-an-array/', 4, 85),
(378, 'Find All Numbers Disappeared in an Array', 'EASY', 3, 'https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/', 5, 85),

-- Pattern 86: Palindrome Check
(379, 'Palindrome Number', 'EASY', 3, 'https://leetcode.com/problems/palindrome-number/', 1, 86),
(380, 'Valid Palindrome', 'EASY', 3, 'https://leetcode.com/problems/valid-palindrome/', 2, 86),
(381, 'Valid Palindrome II', 'EASY', 3, 'https://leetcode.com/problems/valid-palindrome-ii/', 3, 86),

-- Pattern 87: Anagram Check
(382, 'Group Anagrams', 'MEDIUM', 6, 'https://leetcode.com/problems/group-anagrams/', 1, 87),
(383, 'Valid Anagram', 'EASY', 3, 'https://leetcode.com/problems/valid-anagram/', 2, 87),

-- Pattern 88: Roman Conversion
(384, 'Roman to Integer', 'EASY', 3, 'https://leetcode.com/problems/roman-to-integer/', 1, 88),
(385, 'Integer to Roman', 'MEDIUM', 6, 'https://leetcode.com/problems/integer-to-roman/', 2, 88),

-- Pattern 89: String to Integer
(386, 'String to Integer (atoi)', 'MEDIUM', 6, 'https://leetcode.com/problems/string-to-integer-atoi/', 1, 89),
(387, 'Valid Number', 'HARD', 9, 'https://leetcode.com/problems/valid-number/', 2, 89),

-- Pattern 90: Multiply Strings
(388, 'Multiply Strings', 'MEDIUM', 6, 'https://leetcode.com/problems/multiply-strings/', 1, 90),
(389, 'Add Strings', 'EASY', 3, 'https://leetcode.com/problems/add-strings/', 2, 90),
(390, 'Add Binary', 'EASY', 3, 'https://leetcode.com/problems/add-binary/', 3, 90),

-- Pattern 91: String Matching
(391, 'Find the Index of the First Occurrence in a String', 'EASY', 3, 'https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/', 1, 91),
(392, 'Shortest Palindrome', 'HARD', 9, 'https://leetcode.com/problems/shortest-palindrome/', 2, 91),
(393, 'Repeated String Match', 'MEDIUM', 6, 'https://leetcode.com/problems/repeated-string-match/', 3, 91),
(394, 'Rotate String', 'EASY', 3, 'https://leetcode.com/problems/rotate-string/', 4, 91),
(395, 'Find Beautiful Indices in the Given Array II', 'HARD', 9, 'https://leetcode.com/problems/find-beautiful-indices-in-the-given-array-ii/', 5, 91),

-- Pattern 92: Repeated Substring
(396, 'Repeated Substring Pattern', 'EASY', 3, 'https://leetcode.com/problems/repeated-substring-pattern/', 1, 92),
(397, 'Find the Index of the First Occurrence in a String', 'EASY', 3, 'https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/', 2, 92),
(398, 'Repeated String Match', 'MEDIUM', 6, 'https://leetcode.com/problems/repeated-string-match/', 3, 92),

-- Pattern 93: Design
(399, 'LRU Cache', 'MEDIUM', 6, 'https://leetcode.com/problems/lru-cache/', 1, 93),
(400, 'Min Stack', 'MEDIUM', 6, 'https://leetcode.com/problems/min-stack/', 2, 93),
(401, 'Implement Stack using Queues', 'EASY', 3, 'https://leetcode.com/problems/implement-stack-using-queues/', 3, 93),
(402, 'Implement Queue using Stacks', 'EASY', 3, 'https://leetcode.com/problems/implement-queue-using-stacks/', 4, 93),
(405, 'Find Median from Data Stream', 'HARD', 9, 'https://leetcode.com/problems/find-median-from-data-stream/', 7, 93),
(413, 'All O`one Data Structure', 'HARD', 9, 'https://leetcode.com/problems/all-oone-data-structure/', 15, 93),
(414, 'LFU Cache', 'HARD', 9, 'https://leetcode.com/problems/lfu-cache/', 16, 93),
(420, 'Range Module', 'HARD', 9, 'https://leetcode.com/problems/range-module/', 22, 93),
(430, 'Design a Text Editor', 'HARD', 9, 'https://leetcode.com/problems/design-a-text-editor/', 32, 93),

-- Pattern 94: Tries
(432, 'Implement Trie (Prefix Tree)', 'MEDIUM', 6, 'https://leetcode.com/problems/implement-trie-prefix-tree/', 1, 94),
(433, 'Design Add and Search Words Data Structure', 'MEDIUM', 6, 'https://leetcode.com/problems/design-add-and-search-words-data-structure/', 2, 94),
(434, 'Longest Word in Dictionary', 'MEDIUM', 6, 'https://leetcode.com/problems/longest-word-in-dictionary/', 3, 94),
(435, 'Replace Words', 'MEDIUM', 6, 'https://leetcode.com/problems/replace-words/', 4, 94),
(436, 'Word Squares', 'HARD', 9, 'https://leetcode.com/problems/word-squares/', 5, 94),
(438, 'Prefix and Suffix Search', 'HARD', 9, 'https://leetcode.com/problems/prefix-and-suffix-search/', 7, 94);