/*
 * -------------------------------------------------------------------------
 * validate.c -- Input validation function
 * SWT - Scilab wavelet toolbox
 * Copyright (C) 2005-2006  Roger Liu
 * Copyright (C) 20010-2012  Holger Nahrstaedt
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 * -------------------------------------------------------------------------
 */

//#include "swt_common.h"
//#include "dwt.h"
#include "swtlib.h"
#include "swt_gwsupport.h"
#include "api_scilab.h"
//#include "stack-c.h"
#include "Scierror.h"
//#include "localization.h"
//#include "warningmode.h"
#include "sciprint.h"


/*-------------------------------------------
 * Dimension Checking
 *-----------------------------------------*/
int void_check (void * pvApiCtx, int number, int *type)
{
  int row, col;
  swt_gwsupport_GetMatrixdims(pvApiCtx, number,&row,&col);
  if ((row==0) && (col==0))
    *type = 1;
  else
    *type = 0;
  return 1;
}

int scalar_check (void * pvApiCtx,int number, int *type)
{
  int row, col;
  swt_gwsupport_GetMatrixdims(pvApiCtx, number,&row,&col);
  if ((row==1) && (col==1))
    *type = 1;
  else
    *type = 0;
  return 1;
}

int vector_check (void * pvApiCtx,int number, int *type)
{
  int row, col;
  swt_gwsupport_GetMatrixdims(pvApiCtx, number,&row,&col);
  if ((row==1) && (col>1))
    *type = 1;
  else if ((row>1) && (col==1))
    *type = 1;
  else
    *type = 0;
  return 1;
}

int matrix_check (void * pvApiCtx,int number, int *type)
{
  int row, col;
  swt_gwsupport_GetMatrixdims(pvApiCtx, number,&row,&col);
  if ((row>1) && (col>1))
    *type = 1;
  else
    *type = 0;
  return 1;
}

int real_or_complex (void * pvApiCtx,int number, int *type)
{
  // int il, lw;
  // lw = number + Top - Rhs;
  // il = iadr(*Lstk(lw));
  // *type = *istk(il+3); // 0 if real, 1 if complex
  if (swt_gwsupport_IsVarComplex(pvApiCtx, number))
    *type=1;
  else
    *type=0;
  return 1;
}

int sci_matrix_vector_real (void * pvApiCtx,int number)
{
  int typ1, typ2;
  vector_check(pvApiCtx,number, &typ1);
  real_or_complex(pvApiCtx,number, &typ2);
  if (typ1 && (!typ2) && (swt_gwsupport_GetType(pvApiCtx, number)==sci_matrix))
    return 1;
  else
    return 0;
}

int sci_matrix_vector_complex (void * pvApiCtx,int number)
{
  int typ1, typ2;
  vector_check(pvApiCtx, number, &typ1);
  real_or_complex(pvApiCtx, number, &typ2);
  if (typ1 && typ2 && (swt_gwsupport_GetType(pvApiCtx, number)==sci_matrix))
    return 1;
  else
    return 0;
}

int sci_matrix_matrix_complex (void * pvApiCtx,int number)
{
  int typ1, typ2;
  matrix_check(pvApiCtx, number, &typ1);
  real_or_complex(pvApiCtx, number, &typ2);
  if (typ1 && typ2 && (swt_gwsupport_GetType(pvApiCtx, number)==sci_matrix))
    return 1;
  else
    return 0;
}


int sci_mlist_check (void * pvApiCtx,int number)
{
	if (swt_gwsupport_GetType(pvApiCtx, number)==sci_mlist)
		return 1;
	else
		return 0;
}

//int sci_mlist_real (int number)
//{
//  int typ1, typ2;
//  typ1 = sci_mlist_check (number);
//  real_or_complex(pvApiCtx, number, &typ2);
//  if (typ1 && (!typ2))
//    return 1;
//  else
//    return 0;
//}

int sci_matrix_scalar_real (void * pvApiCtx,int number)
{
  int typ1, typ2;
  scalar_check(pvApiCtx, number, &typ1);
  real_or_complex(pvApiCtx, number, &typ2);
  if (typ1 && (!typ2) && (swt_gwsupport_GetType(pvApiCtx, number)==sci_matrix))
    return 1;
  else
    return 0;
}

int sci_matrix_void (void * pvApiCtx,int number)
{
  int type;
  void_check(pvApiCtx, number, &type);
  if (type && (swt_gwsupport_GetType(pvApiCtx, number)==sci_matrix))
    return 1;
  else
    return 0;
}

int sci_matrix_matrix_real (void * pvApiCtx,int number)
{
  int typ1, typ2;
  matrix_check(pvApiCtx, number, &typ1);
  real_or_complex(pvApiCtx, number, &typ2);
  if (typ1 && (!typ2) && (swt_gwsupport_GetType(pvApiCtx, number)==sci_matrix))
    return 1;
  else
    return 0;
}

int sci_strings_scalar (void * pvApiCtx,int number)
{
  int typ1;
  scalar_check(pvApiCtx, number, &typ1);
  if (typ1 && (swt_gwsupport_GetType(pvApiCtx, number)==sci_strings))
    return 1;
  else
    return 0;
}

int sci_strings_vector (void * pvApiCtx,int number)
{
  int typ1;
  vector_check(pvApiCtx, number, &typ1);
  if (typ1 && (swt_gwsupport_GetType(pvApiCtx, number)==sci_strings))
    return 1;
  else
    return 0;
}




int scalar_string_check(char *l, char c)
{
  if (*l==c)
    return 1;
  else
    return 0;
}

int length_check(void * pvApiCtx,int number, int leng)
{
  int row, col;
  swt_gwsupport_GetMatrixdims(pvApiCtx, number,&row,&col);
  if (row*col == leng)
    return 1;
  else
    return 0;
}

int vector_length_check(void * pvApiCtx,int number1, int number2)
{
  int row1, col1, row2, col2;
  swt_gwsupport_GetMatrixdims(pvApiCtx, number1, &row1, &col1);
  swt_gwsupport_GetMatrixdims(pvApiCtx, number2, &row2, &col2);
  if ((row1*col1)==(row2*col2))
    return 1;
  else
    return 0;
}

int vector_length_compare(void * pvApiCtx,int number, int leng, int *res)
{
  int row, col;
  swt_gwsupport_GetMatrixdims(pvApiCtx, number,&row,&col);
  if (row*col == leng)
    *res = 0;
  else if (row*col > leng)
    *res = 1;
  else
    *res = -1;
  return 1;
}

int matrix_length_compare(void * pvApiCtx,int number, int rowLeng, int colLeng,
			   int *resRow, int *resCol)
{
  int row, col;
  swt_gwsupport_GetMatrixdims(pvApiCtx, number,&row,&col);
  if (row == rowLeng)
    *resRow = 0;
  else if (row > rowLeng)
    *resRow = 1;
  else
    *resRow = -1;
  if (col == colLeng)
    *resCol = 0;
  else if (col > colLeng)
    *resCol = 1;
  else
    *resCol = -1;
  return 1;
}

int
matrix_col_length_check(void * pvApiCtx,int number, int leng)
{
  int row, col;
  swt_gwsupport_GetMatrixdims(pvApiCtx, number, &row, &col);
  if (col==leng)
    return 1;
  else
    return 0;
}

int
matrix_row_length_check(void * pvApiCtx,int number, int leng)
{
  int row, col;
  swt_gwsupport_GetMatrixdims(pvApiCtx, number, &row, &col);
  if (row==leng)
    return 1;
  else
    return 0;
}

int
matrix_length_check (void * pvApiCtx,int number1, int number2)
{
  int row1, col1, row2, col2;
  swt_gwsupport_GetMatrixdims(pvApiCtx, number1, &row1, &col1);
  swt_gwsupport_GetMatrixdims(pvApiCtx, number2, &row2, &col2);
  if ((row1==row2) && (col1==col2))
    return 1;
  else
    return 0;
}

void extension_check(char *mode, int *type)
{
  int count;
  *type = 0;
  for (count=0;count<extensionIdentityNum;count++)
    {
      if (strcmp(mode,ei[count].extMethodName) == 0)
	{
	  *type = 1;
	  break;
	}
    }
  return;
}

void wavelet_family_check(char *wname, int wf, int *type)
{
  int count;
  *type = 0;
  for(count=0;count<waveletIdentityNum;count++)
    {
      if ((strcmp(wname,wi[count].wname) == 0) &&
	  (wi[count].family==wf))
	{
	  *type = 1;
	  break;
	}
    }
  return;
}


/*-------------------------------------------
 * Validation Error Notification
 *-----------------------------------------*/

void
validate_print (int errCode)
{
  int count;
  for(count=0;count<errorNum;count++)
  {
    if(strErrNoti[count].errorNumber==errCode)
	{
		sciprint(strErrNoti[count].message);
		break;
	}
  }
  return;
}
