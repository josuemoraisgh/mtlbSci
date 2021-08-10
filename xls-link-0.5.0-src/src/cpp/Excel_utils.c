/*--------------------------------------------------------------------------*/
/* Allan CORNET */
/* DIGITEO 2008 - 2010 */
/*--------------------------------------------------------------------------*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "Excel_utils.h"

#define RANGE_STRING_SIZE_MAX   50
#define ALPHA_SIZE              ('Z'-'A'+1)
/*--------------------------------------------------------------------------*/
/* http://support.microsoft.com/kb/198112/en-us */
/* version extended to manage excel 2007 */
wchar_t* IndToStr(int row,int col)
{
    wchar_t* returnedStr = (wchar_t*)calloc(RANGE_STRING_SIZE_MAX, sizeof(wchar_t));

    /* checks limits */
    if (row < 0) row = 1;
    if (col < 0) col = 1;

    if (returnedStr)
    {
        if (col > ALPHA_SIZE * ALPHA_SIZE)
        {
            wchar_t c_col1 = (wchar_t)( L'A' + (col - 1) / (ALPHA_SIZE * ALPHA_SIZE) - 1 );
            wchar_t c_col3 = (wchar_t)( L'A' + (col - 1) % ALPHA_SIZE );

            int value_col3 = (c_col3 - L'A') + 1;
            int value_col1 = (c_col1 - L'A') + 1;

            int  value_col2 = (col - value_col3 - + (value_col1 * ALPHA_SIZE * ALPHA_SIZE)) / ALPHA_SIZE ;
            wchar_t c_col2 = (wchar_t)(L'A' + value_col2 - 1 );

            swprintf_s(returnedStr, RANGE_STRING_SIZE_MAX, L"%c%c%c%d", c_col1, c_col2, c_col3, row);
        }
        else if (col > ALPHA_SIZE)
        {
            wchar_t c_col1 = (wchar_t)(L'A' + (col - 1) / ALPHA_SIZE - 1);
            wchar_t c_col2 = (wchar_t)(L'A' + (col - 1) % ALPHA_SIZE);
            swprintf_s(returnedStr, RANGE_STRING_SIZE_MAX, L"%c%c%d", c_col1, c_col2, row);
        }
        else
        {
            wchar_t c_col = (wchar_t)(L'A' + (col - 1) % ALPHA_SIZE);
            swprintf_s(returnedStr, RANGE_STRING_SIZE_MAX, L"%c%d", c_col, row);
        }
    }
    return returnedStr;
}
/*--------------------------------------------------------------------------*/
