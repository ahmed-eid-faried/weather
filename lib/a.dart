class Solution {
  void merge(List<int> nums1, int m, List<int> nums2, int n) {
    List<int> num = [];
    for (int i = 0; i < m; i++) {
      num.add(nums1[i]);
    }
    for (int i = 0; i < n; i++) {
      num.add(nums2[i]);
    }
    // return num;
  }
}
