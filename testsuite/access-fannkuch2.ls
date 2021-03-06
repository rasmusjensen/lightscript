// The Great Computer Language Shootout
//   http://shootout.alioth.debian.org/
//   contributed by Isaac Gouy
//
//modified for lightscript
test('
function fannkuch(n) {
   var check = 30;
   var perm = [];
   var perm1 = [];
   var count = [];
   var maxPerm = [];
   var maxFlipsCount = 0;
   var m = n - 1;

   for (var i = 0; i < n; ++i) perm1[i] = i;
   var r = n;

   while (true) {
      // write-out the first 30 permutations
      if (check < 30){
         var s = "";
         for(var i=0; i<n; ++i) s += (perm1[i]+1).toString();
         ++check;
      }

      while (r !== 1) { count[r - 1] = r; --r; }
      if (!(perm1[0] === 0 || perm1[m] === m)) {
         for (var i = 0; i < n; ++i) perm[i] = perm1[i];

         var flipsCount = 0;
         var k;

         while (!((k = perm[0]) === 0)) {
            var k2 = (k + 1) >> 1;
            for (var i = 0; i < k2; ++i) {
               var temp = perm[i]; perm[i] = perm[k - i]; perm[k - i] = temp;
            }
            ++flipsCount;
         }

         if (flipsCount > maxFlipsCount) {
            maxFlipsCount = flipsCount;
            for (var i = 0; i < n; ++i) maxPerm[i] = perm1[i];
         }
      }

      --r;
      do {
         ++r;
         if (r === n) return maxFlipsCount;
         var perm0 = perm1[0];
         var i = 0;
         while (i < r) {
            var j = i + 1;
            perm1[i] = perm1[j];
            i = j;
         }
         perm1[r] = perm0;

         count[r] = count[r] - 1;
      } while(!(count[r] > 0));
   }
};
fannkuch(6)', 10);
