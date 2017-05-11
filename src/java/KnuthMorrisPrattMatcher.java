/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Utkarsh
 */
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Utkarsh
 */
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

/**
 * This class contains different string matching algorithms as static methods.
 *
 * @author Rodion "rodde" Efremov
 * @version 1.6 (Nov 7, 2015)
 */

    class KnuthMorrisPrattMatcher {
    public static final int NOT_FOUND_INDEX = -1;
        /**
         * This static method implements the 
         * <a href="https://en.wikipedia.org/wiki/Knuth%E2%80%93Morris%E2%80%93Pratt_algorithm">
         * Knuth-Morris-Pratt</a> pattern matching algorithm that runs in time
         * {@code O(n + m)}, where {@code n} is the length of the text to search
         * and {@code m} is the length of the pattern to search.
         * 
         * @param text       the text to search in.
         * @param pattern    the pattern to search for.
         * @param startIndex the character index from which to start matching.
         * @return the smallest index no less than {@code startIndex} of the
         *         position where the pattern occurs if there is a match, or
         *         {@code NOT_FOUND_INDEX} if there is no match.
         */
        public int match(String text, String pattern, int startIndex) {
            if (pattern.isEmpty()) {
                return 0;
            }

            int n = text.length();
            int m = pattern.length();

            if (m > n) {
                return -1;
            }

            int[] prefixFunction = computePrefixFunction(pattern);
            int q = 0;

            for (int i = Math.max(0, startIndex); i < n; ++i) {
                while (q > 0 && pattern.charAt(q) != text.charAt(i)) {
                    q = prefixFunction[q - 1];
                }

                if (pattern.charAt(q) == text.charAt(i)) {
                    ++q;
                }

                if (q == m) {
                    return i - m + 1;
                }
            }

            return NOT_FOUND_INDEX;
        }

        public int match(String text, String pattern) {
            return match(text, pattern, 0);
        }

        private static int[] computePrefixFunction(String pattern) {
            int m = pattern.length();
            int[] prefixFunction = new int[m];
            int k = 0;

            for (int q = 1; q < m; ++q) {
                while (k > 0 && pattern.charAt(k) != pattern.charAt(q)) {
                    k = prefixFunction[k - 1];
                }

                if (pattern.charAt(k) == pattern.charAt(q)) {
                    ++k;
                }

                prefixFunction[q] = k;
            }

            return prefixFunction;
        }
    }