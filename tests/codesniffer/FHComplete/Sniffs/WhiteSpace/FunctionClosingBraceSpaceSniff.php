<?php
/**
 * PHP Version 5
 *
 * FHComplete
 */

/**
 * Checks that there is one empty line before the closing brace of a function.
 *
 */
class FHComplete_Sniffs_WhiteSpace_FunctionClosingBraceSpaceSniff implements PHP_CodeSniffer_Sniff
{

    /**
     * Returns an array of tokens this test wants to listen for.
     *
     * @return array
     */
    public function register()
    {
        return array(T_FUNCTION);
    }

    /**
     * Processes this test, when one of its tokens is encountered.
     *
     * @param PHP_CodeSniffer_File $phpcsFile The file being scanned.
     * @param integer $stackPtr  The position of the current token
     *    in the stack passed in $tokens.
     * @return void
     */
    public function process(PHP_CodeSniffer_File $phpcsFile, $stackPtr)
    {
        $tokens = $phpcsFile->getTokens();

        if (isset($tokens[$stackPtr]['scope_closer']) === false) {
            // Probably an interface method.
            return;
        }

        $closeBrace = $tokens[$stackPtr]['scope_closer'];
        $prevContent = $phpcsFile->findPrevious(T_WHITESPACE, ($closeBrace - 1), null, true);

        $braceLine = $tokens[$closeBrace]['line'];
        $prevLine = $tokens[$prevContent]['line'];

        $found = ($braceLine - $prevLine - 1);
        if ($phpcsFile->hasCondition($stackPtr, T_FUNCTION) === true
         || isset($tokens[$stackPtr]['nested_parenthesis']) === true
        ) {
            // Nested function.
            if ($found < 0) {
                $error = 'Closing brace of nested function must be on a new line';
                $phpcsFile->addError($error, $closeBrace, 'ContentBeforeClose');
            } elseif ($found > 0) {
                $error = 'Expected 0 blank lines before closing brace of nested function; %s found';
                $data = array($found);
                $phpcsFile->addError($error, $closeBrace, 'SpacingBeforeNestedClose', $data);
            }
        } else {
            if ($found !== 0) {
                $error = 'Expected 0 blank lines before closing function brace; %s found';
                $data = array($found);
                $phpcsFile->addError($error, $closeBrace, 'SpacingBeforeClose', $data);
            }
        }
    }
}
