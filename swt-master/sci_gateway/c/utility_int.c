/*
 * -------------------------------------------------------------------------
 * utility_int.c -- utility function interface
 * SWT - Scilab wavelet toolbox
 * Copyright (C) 2005-2007  Roger Liu
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

#include "swt_common.h"


// #include <stack-c.h>

/*-------------------------------------------
 * convolution
 *-----------------------------------------*/

int
int_conv 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int l1, m1, n1, l2, m2, n2, l3, m3, n3;
  static int minlhs = 1, maxlhs = 1, minrhs = 2, maxrhs = 2;
  int errCode;
  int readFlag;
  double *input1;
  double *input2;
  double *output1;
  /* Input Validation */
  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);
  /* Get Input */
  //GetRhsVar (1, "d", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  //GetRhsVar (2, "d", &m2, &n2, &l2);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 2,  &m2, &n2, &input2);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  conv_validate (pvApiCtx, &errCode);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);	/* Indicate error  */
      return 0;			/* Stop when validation fails */
    }
  /* Memory Management */
  m3 = 1;
  n3 = m1 * n1 + m2 * n2 - 1;
  // CreateVar (3, "d", &m3, &n3, &l3);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }

  /* Actual Processing */
  conv (input1, n1 * m1, output1, n3, input2, n2 * m2);
  /* Return Value */
  //LhsVar (1) = 3;
  return 0;
}

/*-------------------------------------------
 * circular or periodic convolution
 *-----------------------------------------*/

int
int_iconv 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int l1, m1, n1, l2, m2, n2, l3, m3, n3;
  static int minlhs = 1, maxlhs = 1, minrhs = 2, maxrhs = 2;
  int errCode;
  int readFlag;
  double *input1;
  double *input2;
  double *output1;
  /* Input Validation */
  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);
  /* Get Input */
    //GetRhsVar (1, "d", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  //GetRhsVar (2, "d", &m2, &n2, &l2);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 2,  &m2, &n2, &input2);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  conv_validate (pvApiCtx, &errCode);

  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }
  /* Memory Management */
  m3 = 1;
  if (m1*n1>m2*n2)
      n3 = m1 * n1;
  else
	  n3 = m2 * n2;
    //CreateVar (3, "d", &m3, &n3, &l3);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  /* Actual Processing */
  if (m1*n1>m2*n2)
     i_conv (input1, n1 * m1, output1, n3, input2, n2 * m2);
  else
      i_conv (input2, n2 * m2, output1, n3, input1, n1 * m1);
  /* Return Value */
  //LhsVar (1) = 3;
  return 0;
}


/*-------------------------------------------
 * wrev
 *-----------------------------------------*/

int
int_wrev 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int l1, m1, n1, l2, m2, n2;
  static int minlhs = 1, maxlhs = 1, minrhs = 1, maxrhs = 1;
  int errCode;
  int readFlag;
  double *input1;
  double *output1;

  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  wrev_validate (pvApiCtx, &errCode);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }
    //GetRhsVar (1, "d", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }

  m2 = m1;
  n2 = n1;
  //CreateVar (2, "d", &m2, &n2, &l2);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m2 , n2 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }

  wrev (input1, n1 * m1, output1, n1 * m1);

  //LhsVar (1) = 2;
  return 0;
}

/*-------------------------------------------
 * qmf
 *-----------------------------------------*/

int
int_qmf 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int l1, m1, n1, l2, m2, n2, l3, m3, n3;
  static int minlhs = 1, maxlhs = 1, minrhs = 1, maxrhs = 2;
  int errCode, flow;
  int readFlag;
  double *input1;
  int *int_input2;
  double *output1;
  /* Input Validation  */
  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  qmf_validate (pvApiCtx, &flow, &errCode, Rhs);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

    //GetRhsVar (1, "d", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }

  switch (flow){
  case 1:
    {
      m2 = m1;
      n2 = n1;
      //CreateVar (2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m2 , n2 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      qmf_even (input1, n1 * m1, output1, n1 * m1);
      //LhsVar (1) = 2;
      break;
    }
  case 2:
    {
      //GetRhsVar (2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 2,  &m2, &n2, &int_input2);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      m3 = m1;
      n3 = n1;
        //CreateVar (3, "d", &m3, &n3, &l3);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
      if ((int_input2[0] % 2) == 0) /* even */
	qmf_even (input1, n1 * m1, output1, n1 * m1);
      else
	qmf_odd (input1, n1 * m1, output1, n1 * m1);
      //LhsVar (1) = 3;
      break;
    }
  default:
    break;
  }
  return 0;
}


/*-------------------------------------------
 * dyaddown
 *-----------------------------------------*/

int
int_dyaddown 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int l1, m1, n1, l2, m2, n2, l3, m3, n3, l4, m4, n4;
  static int minlhs = 1, maxlhs = 1, minrhs = 1, maxrhs = 3;
  int flow, errCode;
  int readFlag;
  double *input1;
  int *int_input2;
  int *int_input3;
  char * input_string1 = NULL;
  double *output1;
  /* Input Validation */
  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  flow = 0;
  dyaddown_form_validate (pvApiCtx, &flow, &errCode, Rhs);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  switch (flow){
  case 1:
    {
        //GetRhsVar (1, "d", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
      if (m1 > 1)
	{
	  m2 = m1 / 2;// + (m1%2==0)?0:1;
	  n2 = 1;
	}
      else
	{
	  m2 = 1;
	  n2 = n1 / 2;// + (n1%2==0)?0:1;
	}
            //CreateVar (2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m2 , n2 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      dyaddown_1D_keep_even (input1, n1 * m1, output1, n2 * m2);
      //LhsVar (1) = 2;
      break;
    }
  case 2:
    {
        //GetRhsVar (1, "d", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
        //GetRhsVar (2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 2,  &m2, &n2, &int_input2);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
    //  if (m1 > 1)
	//{
	 // m3 = m1 / 2;
	 // n3 = 1;
	//}
    //  else
	//{
	//  m3 = 1;
	//  n3 = n1 / 2;
	//}
    // CreateVar (3, "d", &m3, &n3, &l3);

      if (int_input2[0] % 2 == 0)
	  {
		if (m1 > 1)
		{
		 m3 = m1 / 2;
		 n3 = 1;
		}
		else
		{
		  m3 = 1;
		  n3 = n1 / 2;
		}
		  //CreateVar (3, "d", &m3, &n3, &l3);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
		dyaddown_1D_keep_even (input1, n1 * m1, output1, n3 * m3);
	  }
      else
	  {
		if (m1 > 1)
		{
			m3 = m1 / 2;// + ((m1%2)==0)?0:1;
			n3 = 1;
			if (m1 % 2 != 0)
				m3 += 1;
		}
		else
		{
		  m3 = 1;
		  n3 = n1 / 2;// + ((n1%2)==0)?0:1;
		  if (n1 % 2 != 0)
			  n3 += 1;
		}
		//sprintf("%d\n",m3);
		//sprintf("%d\n",n3);
		  //CreateVar (3, "d", &m3, &n3, &l3);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
		dyaddown_1D_keep_odd (input1, n1 * m1, output1, n3 * m3);
	  }
      //LhsVar (1) = 3;
      break;
    }
  case 3:
    {
        //GetRhsVar (1, "d", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
      //m2 = m1 / 2;
	  m2 = m1;
      n2 = n1 / 2;
      //CreateVar (2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m2 , n2 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //dyaddown_2D_keep_even (input1, m1, n1, stk(l2), m2, n2);
	  dyaddown_2D_keep_even_col(input1, m1, n1, output1, m2, n2);
      //LhsVar (1) = 2;
      break;
    }
  case 4:
    {
      //GetRhsVar (1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar (2, "c", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 2 , &input_string1 );
      m2=1;n2=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //printf("%c\n",cstk(l2)[0]);
      dyaddown_content_validate (pvApiCtx, input_string1, &errCode);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if (strcmp(input_string1,"r")==0)
	{
	  m3 = m1 / 2;
	  n3 = n1;
	    //CreateVar (3, "d", &m3, &n3, &l3);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
	  dyaddown_2D_keep_even_row(input1, m1, n1,
				    output1, m3, n3);
	}
      if (strcmp(input_string1,"c")==0)
	{
	  m3 = m1;
	  n3 = n1 / 2;
	    //CreateVar (3, "d", &m3, &n3, &l3);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
	  dyaddown_2D_keep_even_col(input1, m1, n1,
				    output1, m3, n3);
	}
      if (strcmp(input_string1,"m")==0)
	{
	  m3 = m1 / 2;
	  n3 = n1 / 2;
	    //CreateVar (3, "d", &m3, &n3, &l3);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
	  dyaddown_2D_keep_even(input1, m1, n1, output1, m3, n3);
	}
      //LhsVar (1) = 3;
      break;
    }
  case 5:
    {
        //GetRhsVar (1, "d", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
        //GetRhsVar (2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 2,  &m2, &n2, &int_input2);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //m3 = m1 / 2;

      if (int_input2[0]%2==0)
	  {
 	    m3 = m1;
        n3 = n1 / 2;
          //CreateVar (3, "d", &m3, &n3, &l3);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
		dyaddown_2D_keep_even_col(input1, m1, n1, output1, m3, n3);
	  }
      else
	  {
        m3 = m1;
		n3 = n1 /2;
		if (n1 % 2 != 0)
			n3 += 1;
          //CreateVar (3, "d", &m3, &n3, &l3);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
	    dyaddown_2D_keep_odd_col(input1, m1, n1, output1, m3, n3);
	  }
      //LhsVar (1) = 3;
      break;
    }
  case 6:
    {
        //GetRhsVar (1, "d", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
        //GetRhsVar (2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 2,  &m2, &n2, &int_input2);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar (3, "c", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 3 , &input_string1 );
      m3=1;n3=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      dyaddown_content_validate (pvApiCtx, input_string1, &errCode);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if ((int_input2[0])%2==0)
	{
	  if (strcmp(input_string1,"r")==0)
	    {
	      m4 = m1 / 2;
	      n4 = n1;
	      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
	      dyaddown_2D_keep_even_row(input1, m1, n1,
					output1, m4, n4);
	    }
	  if (strcmp(input_string1,"c")==0)
	    {
	      m4 = m1;
	      n4 = n1 / 2;
	      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
	      dyaddown_2D_keep_even_col(input1, m1, n1,
					output1, m4, n4);
	    }
	  if (strcmp(input_string1,"m")==0)
	    {
	      m4 = m1 / 2;
	      n4 = n1 / 2;
	      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
	      dyaddown_2D_keep_even(input1, m1, n1,
				    output1, m4, n4);
	    }
	}
      else
	{
	  if (strcmp(input_string1,"r")==0)
	    {
	      m4 = m1 / 2;
	      n4 = n1;
		  if (m1 % 2 != 0)
			  m4 += 1;
	      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
	      dyaddown_2D_keep_odd_row(input1, m1, n1,
				       output1, m4, n4);
	    }
	  if (strcmp(input_string1,"c")==0)
	    {
	      m4 = m1;
	      n4 = n1 / 2;
		  if (n1 % 2 != 0)
			  n4 += 1;
	      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
	      dyaddown_2D_keep_odd_col(input1, m1, n1,
				       output1, m4, n4);
	    }
	  if (strcmp(input_string1,"m")==0)
	    {
	      m4 = m1 / 2;
	      n4 = n1 / 2;
		  if (m1 % 2 != 0)
			  m4 += 1;
		  if (n1 % 2 != 0)
			  n4 += 1;
	      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
	      dyaddown_2D_keep_odd(input1, m1, n1,
				   output1, m4, n4);
	    }
	}
      //LhsVar (1) = 4;
      break;
    }
  case 7:
    {
        //GetRhsVar (1, "d", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
      //GetRhsVar (2, "c", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 2 , &input_string1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar (3, "i", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 3,  &m3, &n3, &int_input3);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      dyaddown_content_validate (pvApiCtx, input_string1, &errCode);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if ((int_input3[0])%2==0)
	{
	  if (strcmp(input_string1,"r")==0)
	    {
	      m4 = m1 / 2;
	      n4 = n1;
	      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
	      dyaddown_2D_keep_even_row(input1, m1, n1,
					output1, m4, n4);
	    }
	  if (strcmp(input_string1,"c")==0)
	    {
	      m4 = m1;
	      n4 = n1 / 2;
	      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
	      dyaddown_2D_keep_even_col(input1, m1, n1,
					output1, m4, n4);
	    }
	  if (strcmp(input_string1,"m")==0)
	    {
	      m4 = m1 / 2;
	      n4 = n1 / 2;
	      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
	      dyaddown_2D_keep_even(input1, m1, n1,
				    output1, m4, n4);
	    }
	}
      else
	{
	  if (strcmp(input_string1,"r")==0)
	    {
	      m4 = m1 / 2;
	      n4 = n1;
		  if (m1 % 2 != 0)
			  m4 += 1;
	      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
	      dyaddown_2D_keep_odd_row(input1, m1, n1,
				       output1, m4, n4);
	    }
	  if (strcmp(input_string1,"c")==0)
	    {
	      m4 = m1;
	      n4 = n1 / 2;
		  if (n1 % 2 != 0)
			  n4 += 1;
	      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
	      dyaddown_2D_keep_odd_col(input1, m1, n1,
				       output1, m4, n4);
	    }
	  if (strcmp(input_string1,"m")==0)
	    {
	      m4 = m1 / 2;
	      n4 = n1 / 2;
		  if (m1 % 2 != 0)
			  m4 += 1;
		  if (n1 % 2 != 0)
			  n4 += 1;
	      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
	      dyaddown_2D_keep_odd(input1, m1, n1,
				   output1, m4, n4);
	    }
	}
      //LhsVar (1) = 4;
      break;
    }
  default:
    break;
  }
  return 0;
}

/*-------------------------------------------
 * dyadup
 *-----------------------------------------*/

int
int_dyadup 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int l1, m1, n1, l2, m2, n2, l3, m3, n3, l4, m4, n4;
  static int minlhs = 1, maxlhs = 1, minrhs = 1, maxrhs = 3;
  int flow, errCode;
  int readFlag;
  double *input1;
  int *int_input2;
  int *int_input3;
  char * input_string1 = NULL;
  double *output1;
  /* Input Validation */
  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  flow = 0;
  dyadup_form_validate (pvApiCtx, &flow, &errCode, Rhs);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  switch (flow){
  case 1:
    {
        //GetRhsVar (1, "d", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
      if (m1 > 1)
	{
	  m2 = m1 * 2 + 1;
	  n2 = 1;
	}
      else
	{
	  m2 = 1;
	  n2 = n1 * 2 + 1;
	}
            //CreateVar (2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m2 , n2 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      dyadup_1D_feed_even (input1, n1 * m1, output1, n2 * m2);
      LhsVar (1) = 2;
      break;
    }
  case 2:
    {
        //GetRhsVar (1, "d", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
        //GetRhsVar (2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 2,  &m2, &n2, &int_input2);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      if (int_input2[0] % 2 == 0)
	{
	  if (m1 > 1)
	    {
	      m3 = m1 * 2 - 1;
	      n3 = 1;
	    }
	  else
	    {
	      m3 = 1;
	      n3 = n1 * 2 - 1;
	    }
	    //CreateVar (3, "d", &m3, &n3, &l3);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
	  dyadup_1D_feed_odd (input1, n1 * m1, output1, n3 * m3);
	}
      else
	{
	  if (m1 > 1)
	    {
	      m3 = m1 * 2 + 1;
	      n3 = 1;
	    }
	  else
	    {
	      m3 = 1;
	      n3 = n1 * 2 + 1;
	    }
	    //CreateVar (3, "d", &m3, &n3, &l3);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
	  dyadup_1D_feed_even (input1, n1 * m1, output1, n3 * m3);
	}
      //LhsVar (1) = 3;
      break;
    }
  case 3:
    {
        //GetRhsVar (1, "d", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
      //m2 = m1 * 2 + 1;
      //n2 = n1 * 2 + 1;
	  m2 = m1;
	  n2 = n1 * 2 + 1;
            //CreateVar (2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m2 , n2 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
	  dyadup_2D_feed_even_col (input1, m1, n1, output1, m2, n2);
      //dyadup_2D_feed_even (input1, m1, n1, stk(l2), m2, n2);
      //LhsVar (1) = 2;
      break;
    }
  case 4:
    {
        //GetRhsVar (1, "d", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
      //GetRhsVar (2, "c", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 2 , &input_string1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      dyadup_content_validate (pvApiCtx, input_string1, &errCode);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if (strcmp(input_string1,"r")==0)
	{
	  m3 = m1 * 2 + 1;
	  n3 = n1;
	    //CreateVar (3, "d", &m3, &n3, &l3);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
	  dyadup_2D_feed_even_row(input1, m1, n1,
    output1, m3, n3);
	}
      if (strcmp(input_string1,"c")==0)
	{
	  m3 = m1;
	  n3 = n1 * 2 + 1;
	    //CreateVar (3, "d", &m3, &n3, &l3);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
	  dyadup_2D_feed_even_col(input1, m1, n1,
    output1, m3, n3);
	}
      if (strcmp(input_string1,"m")==0)
	{
	  m3 = m1 * 2 + 1;
	  n3 = n1 * 2 + 1;
	    //CreateVar (3, "d", &m3, &n3, &l3);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
	  dyadup_2D_feed_even(input1, m1, n1, output1, m3, n3);
	}
      //LhsVar (1) = 3;
      break;
    }
  case 5:
    {
        //GetRhsVar (1, "d", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
        //GetRhsVar (2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 2,  &m2, &n2, &int_input2);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      if (int_input2[0]%2==0)
	{
	  //m3 = m1 * 2 - 1;
	  //n3 = n1 * 2 - 1;
	  m3 = m1;
	  n3 = n1 * 2 - 1;
	    //CreateVar (3, "d", &m3, &n3, &l3);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
	  //dyadup_2D_feed_odd(input1, m1, n1, stk(l3), m3, n3);
	  dyadup_2D_feed_odd_col(input1, m1, n1, output1, m3, n3);
	}
      else
	{
	  //m3 = m1 * 2 + 1;
	  //n3 = n1 * 2 + 1;
	  m3 = m1;
	  n3 = n1 * 2 + 1;
	    //CreateVar (3, "d", &m3, &n3, &l3);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
	  //dyadup_2D_feed_even(input1, m1, n1, stk(l3), m3, n3);
	  dyadup_2D_feed_even_col(input1, m1, n1, output1, m3, n3);
	}
      //LhsVar (1) = 3;
      break;
    }
  case 6:
    {
        //GetRhsVar (1, "d", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
        //GetRhsVar (2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 2,  &m2, &n2, &int_input2);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar (3, "c", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 3 , &input_string1 );
      m3=1;n3=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      dyadup_content_validate (pvApiCtx, input_string1, &errCode);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if ((int_input2[0])%2==0)
	{
	  if (strcmp(input_string1,"r")==0)
	    {
	      m4 = m1 * 2 - 1;
	      n4 = n1;
	      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
	      dyadup_2D_feed_odd_row(input1, m1, n1,
					output1, m4, n4);
	    }
	  if (strcmp(input_string1,"c")==0)
	    {
	      m4 = m1;
	      n4 = n1 * 2 - 1;
	      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
	      dyadup_2D_feed_odd_col(input1, m1, n1,
					output1, m4, n4);
	    }
	  if (strcmp(input_string1,"m")==0)
	    {
	      m4 = m1 * 2 - 1;
	      n4 = n1 * 2 - 1;
	      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
	      dyadup_2D_feed_odd(input1, m1, n1,
				    output1, m4, n4);
	    }
	}
      else
	{
	  if (strcmp(input_string1,"r")==0)
	    {
	      m4 = m1 * 2 + 1;
	      n4 = n1;
	      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
	      dyadup_2D_feed_even_row(input1, m1, n1,
				       output1, m4, n4);
	    }
	  if (strcmp(input_string1,"c")==0)
	    {
	      m4 = m1;
	      n4 = n1 * 2 + 1;
	      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
	      dyadup_2D_feed_even_col(input1, m1, n1,
				       output1, m4, n4);
	    }
	  if (strcmp(input_string1,"m")==0)
	    {
	      m4 = m1 * 2 + 1;
	      n4 = n1 * 2 + 1;
	      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
	      dyadup_2D_feed_even(input1, m1, n1,
				   output1, m4, n4);
	    }
	}
      LhsVar (1) = 4;
      break;
    }
  case 7:
    {
        //GetRhsVar (1, "d", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
      //GetRhsVar (2, "c", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 2 , &input_string1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar (3, "i", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 3,  &m3, &n3, &int_input3);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      dyadup_content_validate (pvApiCtx, input_string1, &errCode);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if ((int_input3[0])%2==0)
	{
	  if (strcmp(input_string1,"r")==0)
	    {
	      m4 = m1 * 2 - 1;
	      n4 = n1;
	      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
	      dyadup_2D_feed_odd_row(input1, m1, n1,
					output1, m4, n4);
	    }
	  if (strcmp(input_string1,"c")==0)
	    {
	      m4 = m1;
	      n4 = n1 * 2 - 1;
	      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
	      dyadup_2D_feed_odd_col(input1, m1, n1,
					output1, m4, n4);
	    }
	  if (strcmp(input_string1,"m")==0)
	    {
	      m4 = m1 * 2 - 1;
	      n4 = n1 * 2 - 1;
	      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
	      dyadup_2D_feed_odd(input1, m1, n1,
				    output1, m4, n4);
	    }
	}
      else
	{
	  if (strcmp(input_string1,"r")==0)
	    {
	      m4 = m1 * 2 + 1;
	      n4 = n1;
	      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
	      dyadup_2D_feed_even_row(input1, m1, n1,
				       output1, m4, n4);
	    }
	  if (strcmp(input_string1,"c")==0)
	    {
	      m4 = m1;
	      n4 = n1 * 2 + 1;
	      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
	      dyadup_2D_feed_even_col(input1, m1, n1,
				       output1, m4, n4);
	    }
	  if (strcmp(input_string1,"m")==0)
	    {
	      m4 = m1 * 2 + 1;
	      n4 = n1 * 2 + 1;
	      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
	      dyadup_2D_feed_even(input1, m1, n1,
				   output1, m4, n4);
	    }
	}
      //LhsVar (1) = 4;
      break;
    }
  default:
    break;
  }
  return 0;
}

/*-------------------------------------------
 * wkeep
 *-----------------------------------------*/

int
int_wkeep 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int l1, m1, n1, l2, m2, n2, l3, m3, n3, l4, m4, n4;
  static int minlhs = 1, maxlhs = 1, minrhs = 2, maxrhs = 3;
  int flow, errCode;//, row1, row2, col1, col2;
  int readFlag;
  double *input1=NULL;
  int *int_input2=NULL;
  int *int_input3=NULL;
  char * input_string1 = NULL;
  double *output1;
  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  flow = 0;
  wkeep_form_validate (pvApiCtx, &flow, &errCode, Rhs);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }
  l1 = 0;
  l2 = 0;
  l3 = 0;
  switch (flow){
  case 1:
    {
        //GetRhsVar (1, "d", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
        //GetRhsVar (2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 2,  &m2, &n2, &int_input2);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      wkeep_content_validate (pvApiCtx, flow, &errCode, input1, int_input2, NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if (n1 > 1)
	{
	  m3 = 1;
	  n3 = int_input2[0];
	}
      else
	{
	  m3 = int_input2[0];
	  n3 = 1;
	}
        //CreateVar (3, "d", &m3, &n3, &l3);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
      wkeep_1D_center(input1, n1 * m1, output1, n3 * m3);
      //LhsVar (1) = 3;
      break;
    }
  case 2:
    {
        //GetRhsVar (1, "d", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
        //GetRhsVar (2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 2,  &m2, &n2, &int_input2);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        wkeep_content_validate (pvApiCtx, flow, &errCode, input1, int_input2, NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      m3 = int_input2[0];
      n3 = int_input2[1];
        //CreateVar (3, "d", &m3, &n3, &l3);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
      wkeep_2D_center(input1, m1, n1, output1, m3, n3);
      //LhsVar (1) = 3;
      break;
    }
  case 3:
    {
        //GetRhsVar (1, "d", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
        //GetRhsVar (2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 2,  &m2, &n2, &int_input2);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar (3, "c", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 3 , &input_string1 );
      m3=1;n3=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        wkeep_content_validate_string(pvApiCtx,flow, &errCode, input1, int_input2, input_string1);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if (n1 > 1)
	{
	  m4 = 1;
	  n4 = int_input2[0];
	}
      else
	{
	  m4 = int_input2[0];
	  n4 = 1;
	}
      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      if (((input_string1[0] - 'l') == 0)||((input_string1[0] - 'L') == 0))
	wkeep_1D_left(input1, n1 * m1, output1, n4 * m4);
      else if (((input_string1[0] - 'c') == 0)||((input_string1[0] - 'C') == 0))
	wkeep_1D_center(input1, n1 * m1, output1, n4 * m4);
      else if (((input_string1[0] - 'r') == 0)||((input_string1[0] - 'R') == 0))
	wkeep_1D_right(input1, n1 * m1, output1, n4 * m4);
      LhsVar (1) = 4;
      break;
    }
  case 4:
    {
        //GetRhsVar (1, "d", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
        //GetRhsVar (2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 2,  &m2, &n2, &int_input2);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar (3, "i", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 3,  &m3, &n3, &int_input3);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        wkeep_content_validate (pvApiCtx, flow, &errCode, input1, int_input2, int_input3);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if (n1 > 1)
	{
	  m4 = 1;
	  n4 = int_input2[0];
	}
      else
	{
	  m4 = int_input2[0];
	  n4 = 1;
	}
      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      wkeep_1D_index(input1,n1 * m1,output1,n4 * m4,int_input3[0]);
      //LhsVar (1) = 4;
      break;
    }
  case 5:
    {
        //GetRhsVar (1, "d", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
        //GetRhsVar (2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 2,  &m2, &n2, &int_input2);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar (3, "i", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 3,  &m3, &n3, &int_input3);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        wkeep_content_validate (pvApiCtx, flow, &errCode, input1, int_input2, int_input3);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      m4 = int_input2[0];
      n4 = int_input2[1];
      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      wkeep_2D_index(input1, m1, n1, output1,
		     m4, n4, int_input3[0], int_input3[1]);
    //  LhsVar (1) = 4;
      break;
    }
  default:
    break;
  }
  return 0;
}

/*-------------------------------------------
 * wextend
 *-----------------------------------------*/

int
int_wextend 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{

  static int l1, m1, n1, m2, n2, m3, n3;
  static int  m4, n4, m5, n5, m6, n6;
  static int minlhs = 1, maxlhs = 1, minrhs = 4, maxrhs = 5;
  int flow, errCode;// adr, po, row;//col;
  char c = 'b';
  char cr[2] = "b";
  char **_pstStrings = NULL;
  int *_piLen=NULL;
  int *_piAddress;
  extend_method extMethod;
  int readFlag;
  double *input1;
  int *int_input1=NULL;
  int *int_input2;
  int *int_input3;
  double *input3;
  int *int_input4;
  char * input_string1 = NULL;
  char * input_string2 = NULL;
  char * input_string5 = NULL;
  double *output1;
  int i;

  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  if (swt_gwsupport_GetType(pvApiCtx,1) == sci_matrix){
    //GetRhsVar (1, "i", &m1, &n1, &l1);
    readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 1,  &m1, &n1, &int_input1);
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }


  } else  if (swt_gwsupport_GetType(pvApiCtx,1) == sci_strings){
    //GetRhsVar (1, "c", &m1, &n1, &l1);
    readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 1 , &input_string1 );
    m1=1;n1=1;
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }


  }

  flow = 0;
  //sciprint("before form validate\n");
  wextend_form_validate (pvApiCtx, &flow, &errCode,input_string1,int_input1, Rhs);
  //sciprint("flow=%d\n",flow);
  if (errCode != SUCCESS)
    {
	  //sciprint("form validate error!\n");
      validate_print (errCode);
      return 0;
    }


  switch(flow) {
  case 1:
    {
      //GetRhsVar (2, "c", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 2 , &input_string2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        //GetRhsVar (3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 3,  &m3, &n3, &input3);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar (4, "i", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 4,  &m4, &n4, &int_input4);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar (5, "c", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 5 , &input_string5 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      wextend_content_validate (pvApiCtx, flow, &errCode, input_string2, input3, int_input4, input_string5, NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      extend_method_parse (input_string2, &extMethod);
      if ((extMethod == PER) && ((m3*n3)%2 != 0))
	{
	  if (((input_string5[0]-'l') == 0) || ((input_string5[0]-'r') == 0))
	    {
	      if (m3 > 1)
		{
		  m6 = m3 + int_input4[0] + 1;
		  n6 = 1;
		}
	      else
		{
		  m6 = 1;
		  n6 = n3 + int_input4[0] + 1;
		}
	    }
	  if ((input_string5[0]-'b') == 0)
	    {
	      if (m3 > 1)
		{
		  m6 = m3 + 2*int_input4[0] + 1;
		  n6 = 1;
		}
	      else
		{
		  m6 = 1;
		  n6 = n3 + 2*int_input4[0] + 1;
		}
	    }
	}
      else
	{
	  if (((input_string5[0]-'l') == 0) || ((input_string5[0]-'r') == 0))
	    {
	      if (m3 > 1)
		{
		  m6 = m3 + int_input4[0];
		  n6 = 1;
		}
	      else
		{
		  m6 = 1;
		  n6 = n3 + int_input4[0];
		}
	    }
	  if ((input_string5[0]-'b') == 0)
	    {
	      if (m3 > 1)
		{
		  m6 = m3 + 2*int_input4[0];
		  n6 = 1;
		}
	      else
		{
		  m6 = 1;
		  n6 = n3 + 2*int_input4[0];
		}
	    }
	}
      //CreateVar (6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m6 , n6 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      if (strcmp(input_string5,"l") == 0)
	wextend_1D_left(input3, m3*n3, output1, m6*n6, extMethod);
      else if (strcmp(input_string5,"r") == 0)
	wextend_1D_right(input3, m3*n3, output1, m6*n6, extMethod);
      else
	wextend_1D_center(input3, m3*n3, output1, m6*n6, extMethod);
      //LhsVar (1) = 6;
      break;
    }
  case 2:
    {
      //GetRhsVar (2, "c", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 2 , &input_string2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        //GetRhsVar (3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 3,  &m3, &n3, &input3);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar (4, "i", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 4,  &m4, &n4, &int_input4);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      wextend_content_validate (pvApiCtx, flow, &errCode, input_string2, input3, int_input4, NULL, NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      extend_method_parse (input_string2, &extMethod);
      if ((extMethod == PER) && ((m3*n3)%2 != 0))
	{
	  if (m3 > 1)
	    {
	      m5 = m3 + 2*int_input4[0] + 1;
	      n5 = 1;
	    }
	  else
	    {
	      m5 = 1;
	      n5 = n3 + 2*int_input4[0] + 1;
	    }
	}
      else
	{
	  if (m3 > 1)
	    {
	      m5 = m3 + 2*int_input4[0];
	      n5 = 1;
	    }
	  else
	    {
	      m5 = 1;
	      n5 = n3 + 2*int_input4[0];
	    }
	}
      //CreateVar (5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      wextend_1D_center(input3, m3*n3, output1, m5*n5, extMethod);
      //LhsVar (1) = 5;
      break;
    }
  case 3:
    {
      //GetRhsVar (2, "c", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 2 , &input_string2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        //GetRhsVar (3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 3,  &m3, &n3, &input3);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        //GetRhsVar (4, "i", &m4, &n4, &l4);
        readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 4,  &m4, &n4, &int_input4);
        if(readFlag==SWT_GWSUPPORT_ERROR)
          {
            return 0;
          }
      //GetRhsVar (5, "S", &m5, &n5, &str);
      //readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 5 , &str );
      _pstStrings = swt_gwsupport_GetMatrixOfString(pvApiCtx, fname, 5, &m5 , &n5);
      if(_pstStrings==NULL)
        {
          return 0;
        }

      wextend_content_validate (pvApiCtx, flow, &errCode, input_string2, input3, int_input4, NULL, _pstStrings);

      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      extend_method_parse (input_string2, &extMethod);
      if ((extMethod == PER) && (m3%2 != 0))
	{
	  if (((_pstStrings[0][0]-'l') == 0) || ((_pstStrings[0][0]-'r') == 0))
	    m6 = m3 + int_input4[0] + 1;
	  if ((_pstStrings[0][0]-'b') == 0)
	    m6 = m3 + 2*int_input4[0] + 1;
	}
      else
	{
	  if (((_pstStrings[0][0]-'l') == 0) || ((_pstStrings[0][0]-'r') == 0))
	    m6 = m3 + int_input4[0];
	  if ((_pstStrings[0][0]-'b') == 0)
	    m6 = m3 + 2*int_input4[0];
	}
      if ((extMethod == PER) && (n3%2 != 0))
	{
	  if (((_pstStrings[1][0]-'l') == 0) || ((_pstStrings[1][0]-'r') == 0))
	    n6 = n3 + int_input4[1] + 1;
	  if ((_pstStrings[1][0]-'b') == 0)
	    n6 = n3 + 2*int_input4[1] + 1;
	}
      else
	{
	  if (((_pstStrings[1][0]-'l') == 0) || ((_pstStrings[1][0]-'r') == 0))
	    n6 = n3 + int_input4[1];
	  if ((_pstStrings[1][0]-'b') == 0)
	    n6 = n3 + 2*int_input4[1];
	}
  //CreateVar (6, "d", &m6, &n6, &l6);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m6 , n6 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
      //wextend_2D (stk(l3), m3, n3, stk(l6), m6, n6,
		//  extMethod, &str[0][0], &str[1][0]);
	  wextend_2D (input3, m3, n3, output1, m6, n6,
		  extMethod, &_pstStrings[1][0], &_pstStrings[0][0]);
      //LhsVar (1) = 6;
      //FreeRhsSVar(str);
      //free memory


      for(i = 0 ; i < m5 * n5 ; i++)
        {
          free(_pstStrings[i]);
        }

        free(_pstStrings);
      break;
    }
  case 4:
    {
      //GetRhsVar (2, "c", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 2 , &input_string2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        //GetRhsVar (3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 3,  &m3, &n3, &input3);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        //GetRhsVar (4, "i", &m4, &n4, &l4);
        readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 4,  &m4, &n4, &int_input4);
        if(readFlag==SWT_GWSUPPORT_ERROR)
          {
            return 0;
          }
      wextend_content_validate (pvApiCtx, flow, &errCode, input_string2, input3, int_input4, NULL, NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      extend_method_parse (input_string2, &extMethod);
      if ((extMethod == PER) && (m3%2 != 0))
	m5 = m3 + 2*int_input4[0] + 1;
      else
	m5 = m3 + 2*int_input4[0];
      if ((extMethod == PER) && (n3%2 != 0))
	n5 = n3 + 2*int_input4[0] + 1;
      else
	n5 = n3 + 2*int_input4[0];
      //CreateVar (5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      wextend_2D (input3, m3, n3, output1, m5, n5,
		  extMethod, &c, &c);
      //LhsVar (1) = 5;
      break;
    }
  case 5:
    {
      //GetRhsVar (2, "c", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 2 , &input_string2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        //GetRhsVar (3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 3,  &m3, &n3, &input3);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        //GetRhsVar (4, "i", &m4, &n4, &l4);
        readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 4,  &m4, &n4, &int_input4);
        if(readFlag==SWT_GWSUPPORT_ERROR)
          {
            return 0;
          }
      wextend_content_validate (pvApiCtx, flow, &errCode, input_string2, input3, int_input4, NULL, NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      extend_method_parse (input_string2, &extMethod);
      if ((extMethod == PER) && (m3%2 != 0))
	m5 = m3 + 2*int_input4[0] + 1;
      else
	m5 = m3 + 2*int_input4[0];
      if ((extMethod == PER) && (n3%2 != 0))
	n5 = n3 + 2*int_input4[1] + 1;
      else
	n5 = n3 + 2*int_input4[1];
      //CreateVar (5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      wextend_2D (input3, m3, n3, output1, m5, n5,
		  extMethod, &c, &c);
      //LhsVar (1) = 5;
      break;
    }
  case 6:
    {
      //GetRhsVar (2, "c", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 2 , &input_string2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        //GetRhsVar (3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 3,  &m3, &n3, &input3);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        //GetRhsVar (4, "i", &m4, &n4, &l4);
        readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 4,  &m4, &n4, &int_input4);
        if(readFlag==SWT_GWSUPPORT_ERROR)
          {
            return 0;
          }
      //GetRhsVar (5, "c", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname,5 , &input_string5 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
	  //sciprint("before wextend content validate!\n");
      wextend_content_validate (pvApiCtx, flow, &errCode, input_string2, input3, int_input4, input_string5, NULL);
	  //sciprint("after wextend content validate!\n");
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      extend_method_parse (input_string2, &extMethod);
      if ((extMethod == PER) && (m3%2 != 0))
	{
	  if ((strcmp(input_string5,"l")==0) || (strcmp(input_string5,"r")==0))
	    m6 = m3 + int_input4[0] + 1;
	  if ((strcmp(input_string5,"b") == 0))
	    m6 = m3 + 2*int_input4[0] + 1;
	}
      else
	{
	  if ((strcmp(input_string5,"l")==0) || (strcmp(input_string5,"r")==0))
	    m6 = m3 + int_input4[0];
	  if ((strcmp(input_string5,"b") == 0))
	    m6 = m3 + 2*int_input4[0];
	}
      n6 = n3;
      //CreateVar (6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m6 , n6 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
	  //sciprint("after creation!flow=6\n");
      wextend_2D_row (input3, m3, n3, output1, m6, n6,
		  extMethod, input_string5);
      //LhsVar (1) = 6;
      break;
    }
  case 7:
    {
      //GetRhsVar (2, "c", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 2 , &input_string2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        //GetRhsVar (3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 3,  &m3, &n3, &input3);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        //GetRhsVar (4, "i", &m4, &n4, &l4);
        readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 4,  &m4, &n4, &int_input4);
        if(readFlag==SWT_GWSUPPORT_ERROR)
          {
            return 0;
          }
      wextend_content_validate (pvApiCtx, flow, &errCode, input_string2, input3, int_input4, input_string5, NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      extend_method_parse (input_string2, &extMethod);
      if ((extMethod == PER) && (m3%2 != 0))
	m5 = m3 + 2*int_input4[0] + 1;
      else
	m5 = m3 + 2*int_input4[0];
      n5 = n3;
      //CreateVar (5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      wextend_2D_row (input3, m3, n3, output1, m5, n5,
		  extMethod, &cr);
      //LhsVar (1) = 5;
      break;
    }
  case 8:
    {
      //GetRhsVar (2, "c", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 2 , &input_string2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        //GetRhsVar (3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 3,  &m3, &n3, &input3);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        //GetRhsVar (4, "i", &m4, &n4, &l4);
        readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 4,  &m4, &n4, &int_input4);
        if(readFlag==SWT_GWSUPPORT_ERROR)
          {
            return 0;
          }
          //GetRhsVar (5, "c", &m5, &n5, &l5);
          readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname,5 , &input_string5 );
          if(readFlag==SWT_GWSUPPORT_ERROR)
            {
              return 0;
            }
      wextend_content_validate (pvApiCtx, flow, &errCode, input_string2, input3, int_input4, input_string5, NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      extend_method_parse (input_string2, &extMethod);
      if ((extMethod == PER) && (n3%2 != 0))
	{
	  if ((strcmp(input_string5,"l")==0) || (strcmp(input_string5,"r")==0))
	    n6 = n3 + int_input4[0] + 1;
	  if ((strcmp(input_string5,"b") == 0))
	    n6 = n3 + 2*int_input4[0] + 1;
	}
      else
	{
	  if ((strcmp(input_string5,"l")==0) || (strcmp(input_string5,"r")==0))
	    n6 = n3 + int_input4[0];
	  if ((strcmp(input_string5,"b") == 0))
	    n6 = n3 + 2*int_input4[0];
	}
      m6 = m3;
      //CreateVar (6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m6 , n6 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      wextend_2D_col (input3, m3, n3, output1, m6, n6,
		  extMethod, input_string5);
      //LhsVar (1) = 6;
      break;
    }
  case 9:
    {
      //GetRhsVar (2, "c", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 2 , &input_string2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        //GetRhsVar (3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 3,  &m3, &n3, &input3);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        //GetRhsVar (4, "i", &m4, &n4, &l4);
        readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 4,  &m4, &n4, &int_input4);
        if(readFlag==SWT_GWSUPPORT_ERROR)
          {
            return 0;
          }
      wextend_content_validate (pvApiCtx, flow, &errCode, input_string2, input3, int_input4, NULL, NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      extend_method_parse (input_string2, &extMethod);
      if ((extMethod == PER) && (n3%2 != 0))
	n5 = n3 + 2*int_input4[0] + 1;
      else
	n5 = n3 + 2*int_input4[0];
      m5 = m3;
      //CreateVar (5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      wextend_2D_col (input3, m3, n3, output1, m5, n5,
		  extMethod, &cr);
      //LhsVar (1) = 5;
      break;
    }
  case 10:
    {
      //GetRhsVar (2, "c", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 2 , &input_string2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        //GetRhsVar (3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 3,  &m3, &n3, &input3);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        //GetRhsVar (4, "i", &m4, &n4, &l4);
        readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 4,  &m4, &n4, &int_input4);
        if(readFlag==SWT_GWSUPPORT_ERROR)
          {
            return 0;
          }
          //GetRhsVar (5, "c", &m5, &n5, &l5);
          readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname,5 , &input_string5 );
          if(readFlag==SWT_GWSUPPORT_ERROR)
            {
              return 0;
            }
      wextend_content_validate (pvApiCtx, flow, &errCode, input_string2, input3, int_input4, input_string5, NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      extend_method_parse (input_string2, &extMethod);
      if ((extMethod == PER) && (m3%2 != 0))
	{
	  if ((input_string5[0]=='l') || (input_string5[0]=='r'))
	    m6 = m3 + int_input4[0] + 1;
	  if (input_string5[0]=='b')
	    m6 = m3 + 2*int_input4[0] + 1;
	}
      else
	{
	  if ((input_string5[0]=='l') || (input_string5[0]=='r'))
	    m6 = m3 + int_input4[0];
	  if (input_string5[0]=='b')
	    m6 = m3 + 2*int_input4[0];
	}
      if ((extMethod == PER) && (n3%2 != 0))
	{
	  if ((input_string5[1]=='l') || (input_string5[1]=='r'))
	    n6 = n3 + int_input4[1] + 1;
	  if (input_string5[1]=='b')
	    n6 = n3 + 2*int_input4[1] + 1;
	}
      else
	{
	  if ((input_string5[1]=='l') || (input_string5[1]=='r'))
	    n6 = n3 + int_input4[1];
	  if (input_string5[1]=='b')
	    n6 = n3 + 2*int_input4[1];
	}


  //CreateVar (6, "d", &m6, &n6, &l6);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m6 , n6 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
      wextend_2D (input3, m3, n3, output1, m6, n6,
		  extMethod, &input_string5[1], &input_string5[0]);
	  //wextend_2D (input3, m3, n3, stk(l6), m6, n6,
		//  extMethod, &input_string5[0], &input_string5[1]);
      //LhsVar (1) = 6;
      break;
    }
  default:
    break;
  }
  //sciprint("flow=%d\n",flow);
  return 0;
}

/*-------------------------------------------
 * wcodemat
 *-----------------------------------------*/
int int_wcodemat 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int  m1, n1,  m2, n2,  m3, n3;
  static int  m4, n4,  m5, n5;
  static int minlhs = 1, maxlhs = 1, minrhs = 1, maxrhs = 4;
  int errCode, flow, op, zero, typ, mn, inc;
  double *var;
  int readFlag;
  double *input1;
  int *int_input2;
  int *int_input4;
  char * input_string1 = NULL;
  double *output1;
  //int *int_output1;
  //int *int_output1;
  unsigned short *int_output1;
  /* Input Validation */
  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  wcodemat_form_validate (pvApiCtx, &flow, &errCode, Rhs);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  typ = 12; //I_UINT16;;
  zero = 0;
  inc = 1;

  switch (flow){
  case 1:
	  {
            //GetRhsVar (1, "d", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
		  wcodemat_content_validate (pvApiCtx, &errCode, flow, int_input2);
          if (errCode != SUCCESS)
            {
              validate_print (errCode);
              return 0;
            }
		  m2 = m1;
		  n2 = n1;
		  var=malloc(m2*n2*sizeof(double));
		  typ = 12; //I_UINT16;;
          //CreateVar (2, "I", &m2, &n2, &l2);

      //readFlag = swt_gwsupport_AllocMatrixOfInteger32(pvApiCtx, fname, 1,  m2 , n2 , &int_output1 );
      readFlag = swt_gwsupport_AllocMatrixOfUnsignedInteger16(pvApiCtx, fname, 1,  m2 , n2 , &int_output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }

		  wcodemat_matrix (input1, m1, n1, var, m2, n2, 1, 64, 1);
		  mn = m2*n2;
		  C2F(tpconv)(&zero,&typ,&mn,var, &inc,int_output1, &inc);
		  free(var);
		  //AssignOutputVariable(pvApiCtx,1) = 2;
		  break;
	  }
  case 2:
	  {
            //GetRhsVar (1, "d", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
            //GetRhsVar (2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 2,  &m2, &n2, &int_input2);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        wcodemat_content_validate (pvApiCtx, &errCode, flow, int_input2);
          if (errCode != SUCCESS)
            {
              validate_print (errCode);
              return 0;
            }
		  m3 = m1;
		  n3 = n1;
		  typ = 12; //I_UINT16;;
		  //CreateVar (3, "I", &m3, &n3, &l3);
      //readFlag = swt_gwsupport_AllocMatrixOfInteger32(pvApiCtx, fname, 1,  m3 , n3 , &int_output1 );
      readFlag = swt_gwsupport_AllocMatrixOfUnsignedInteger16(pvApiCtx, fname, 1,  m3 , n3 , &int_output1 );

      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
		  var = malloc(m3*n3*sizeof(double));
		  wcodemat_matrix (input1, m1, n1, var, m3, n3, 1, int_input2[0], 1);
		  mn = m3*n3;
		  C2F(tpconv)(&zero,&typ,&mn,var, &inc,int_output1, &inc);
		  free(var);
		  //AssignOutputVariable(pvApiCtx,1) = 3;
		  break;
	  }
  case 3:
	  {
            //GetRhsVar (1, "d", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
            //GetRhsVar (2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 2,  &m2, &n2, &int_input2);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
          //GetRhsVar (3, "c", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 3 , &input_string1 );
      m3=1;n3=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        wcodemat_content_validate (pvApiCtx, &errCode, flow, int_input2);
          if (errCode != SUCCESS)
            {
              validate_print (errCode);
              return 0;
            }
		  if ((!strcmp(input_string1,"r"))  || (!strcmp(input_string1,"row"))||
	                (!strcmp(input_string1,"c"))  ||	(!strcmp(input_string1,"col"))||
	                (!strcmp(input_string1,"m"))  || (!strcmp(input_string1,"mat")))
		  {

			  m4 = m1;
		      n4 = n1;
			  var=malloc(m4*n4*sizeof(double));
			   typ = 12; //I_UINT16;;
		      //CreateVar (4, "I", &m4, &n4, &l4);
          //readFlag = swt_gwsupport_AllocMatrixOfInteger32(pvApiCtx, fname, 1,  m4 , n4 , &int_output1 );
          readFlag = swt_gwsupport_AllocMatrixOfUnsignedInteger16(pvApiCtx, fname, 1,  m4 , n4 , &int_output1 );
          if(readFlag==SWT_GWSUPPORT_ERROR)
            {
              return 0;
            }
			  if ((!strcmp(input_string1,"c")) || (!strcmp(input_string1,"col")))
				  wcodemat_matrix_col (input1, m1, n1, var, m4, n4, 1, int_input2[0], 1);
			  else if ((!strcmp(input_string1,"r")) || (!strcmp(input_string1,"row")))
				  wcodemat_matrix_row (input1, m1, n1, var, m4, n4, 1, int_input2[0], 1);
			  else if ((!strcmp(input_string1,"m")) || (!strcmp(input_string1,"mat")))
				  wcodemat_matrix (input1, m1, n1, var, m4, n4, 1, int_input2[0], 1);
			  mn = m4*n4;
              C2F(tpconv)(&zero,&typ,&mn,var, &inc,int_output1, &inc);
			  free(var);
		     // AssignOutputVariable(pvApiCtx,1) = 4;
		  }
		  else
		  {
			  sciprint("option argument not valid!\n");
			  return 0;
		  }
		  break;
	  }
  case 4:
	  {
		    //GetRhsVar (1, "d", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
            //GetRhsVar (2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 2,  &m2, &n2, &int_input2);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
          //GetRhsVar (3, "c", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 3 , &input_string1 );
      m3=1;n3=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
          //GetRhsVar (4, "i", &m4, &n4, &l4);
          readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 4,  &m4, &n4, &int_input4);
          if(readFlag==SWT_GWSUPPORT_ERROR)
            {
              return 0;
            }
          wcodemat_content_validate (pvApiCtx, &errCode, flow, int_input2);
          if (errCode != SUCCESS)
            {
              validate_print (errCode);
              return 0;
            }
		  if ((!strcmp(input_string1,"r"))  || (!strcmp(input_string1,"row"))||
	                (!strcmp(input_string1,"c"))  ||	(!strcmp(input_string1,"col"))||
	                (!strcmp(input_string1,"m"))  || (!strcmp(input_string1,"mat")))
		  {
		      m5 = m1;
		      n5 = n1;
			   typ = 12; //I_UINT16;
		      //CreateVar (5, "I", &m5, &n5, &l5);
          //readFlag = swt_gwsupport_AllocMatrixOfInteger32(pvApiCtx, fname, 1,  m5 , n5 , &int_output1 );
          readFlag = swt_gwsupport_AllocMatrixOfUnsignedInteger16(pvApiCtx, fname, 1,  m5 , n5 , &int_output1 );
          if(readFlag==SWT_GWSUPPORT_ERROR)
            {
              return 0;
            }
			  if (int_input4[0] !=0)
				  op = 1;
			  else
				  op = 0;
			  var = malloc(m5*n5*sizeof(double));
			  if ((!strcmp(input_string1,"c")) || (!strcmp(input_string1,"col")))
				  wcodemat_matrix_col (input1, m1, n1, var, m5, n5, 1, int_input2[0], op);
			  else if ((!strcmp(input_string1,"r")) || (!strcmp(input_string1,"row")))
				  wcodemat_matrix_row (input1, m1, n1, var, m5, n5, 1, int_input2[0], op);
			  else if ((!strcmp(input_string1,"m")) || (!strcmp(input_string1,"mat")))
				  wcodemat_matrix (input1, m1, n1, var, m5, n5, 1, int_input2[0], op);
			  mn = m5*n5;
			  C2F(tpconv)(&zero,&typ,&mn,var, &inc,int_output1, &inc);
			  free(var);
		      //AssignOutputVariable(pvApiCtx,1) = 5;
		  }
		  else
		  {
			  sciprint("option argument not valid!\n");
			  return 0;
		  }
		  break;
	  }
  default:
	  break;
    }

  return 0;
}
//
// int_ind2rgb (char *fname
//#ifdef _SCILAB6_
//, void* pvApiCtx)
//#else
//)
//#endif
// {
//   static int l1, m1, n1, l2, m2, n2, l3, m3, n3;
//   static int minlhs = 1, maxlhs = 1, minrhs = 2, maxrhs = 2;
//   int mL, nL, ms, ns, lc2, it, mi, ni, mn, inc, zero, count;
//   int si[3];
//   static char *Str[]= { "hm","dims","entries"};
//   double *var, *temp;
//   SciIntMat M;
//   int readFlag;
//   double *input1;
//   int *int_input2;
//   int *int_input3;
//   char * input_string1 = NULL;
//   double *output1;
//
//   /* Input Validation */
//   CheckInputArgument(pvApiCtx,minrhs, maxrhs);
//   CheckOutputArgument(pvApiCtx,minlhs, maxlhs);
//
//   if ((GetType(1)!=sci_ints)|| (GetType(2)!=sci_matrix))
//   {
// 	  sciprint("Argument 1 should be integer matrix and 2 should be Nx3 double matrix");
//       return 0;
//   }
//   GetRhsVar (1, "I", &m1, &n1, &M);
//   mn = m1*n1;
//   inc  = 1;
//   zero = 0;
//   //C2F(tpconv)(&M.it,&zero,&mn, M.D, &inc, stk(l1), &inc);
//
//   if (M.it==1)
//   {
// 	  sciprint("index matrix should be real integer!\n");
// 	  return 0;
//   }
//
//   GetRhsCVar(2, "d", &it, &m2, &n2, &l2, &lc2);
//
//   if (it==1)
//   {
// 	  sciprint("colormap should be real matrix!\n");
// 	  return 0;
//   }
//   if ((n2!=3))
//   {
// 	  sciprint("colormap should be Nx3 matrix!\n");
//       return 0;
//   }
//
//   si[0] = m1;
//   si[1] = n1;
//   si[2] = 3;
//   // ssi.m = 1;
//   // ssi.n = 3;
//   // ssi.l = 100;
//   // ssi.it = 4;
//   // ssi.D = si;
//   var = malloc(m1*n1*3*sizeof(double));
//   temp = malloc(m1*n1*sizeof(double));
//
//
//   C2F(tpconv)(&M.it,&zero,&mn, M.D, &inc, temp, &inc);
//   for(count=0;count<m1*n1;count++)
//   {
//      if ((int)(temp[count]) < 1)
// 	 {
//          var[count] = stk(l2)[0];
// 		 var[count+m1*n1] = stk(l2)[m2];
// 		 var[count+2*m1*n1] = stk(l2)[2*m2];
// 	 }
// 	 if ((int)(temp[count]) < m2)
// 	 {
// 		 var[count]=stk(l2)[(int)(temp[count])-1];
// 		 var[count+m1*n1]=stk(l2)[(int)(temp[count])+m2-1];
// 		 var[count+m1*n1*2]=stk(l2)[(int)(temp[count])+2*m2-1];
// 	 }
// 	 else
// 	 {
// 		 var[count] = stk(l2)[m2-1];
// 		 var[count+m1*n1] = stk(l2)[2*m2-1];
// 		 var[count+2*m1*n1] = stk(l2)[3*m2-1];
// 	 }
//   }
//   free(temp);
//   mi = 1;
//   ni = 3;
//   ms = 1;
//   ns = 3;
//   mL = 3;
//   nL = 1;
//   m3 = m1*n1*3;
//   n3 = 1;
//   // CreateVar(3, "m", &mL, &nL, &l3);
//   // CreateListVarFromPtr(3,1,"S",&ms,&ns,Str);
//   // CreateListVarFromPtr(3,2,"I",&mi,&ni,&ssi);
//   // CreateListVarFromPtr(3,3,"d",&m3, &n3, &var);
//    readFlag = swt_gwsupport_CreateHypermatOfDouble (pvApiCtx, fname, 1,  si , 3 , var );
//   if(readFlag==SWT_GWSUPPORT_ERROR)
//     {
//       return 0;
//     }
//   free(var);
//   //AssignOutputVariable(pvApiCtx,1) = 3;
//
//   return 0;
// }


int
int_mat3Dtran 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int l1, m1, n1, l2, m2, n2, l3, m3, n3, mL2, nL2, s4;
  static int it3, mL3, nL3, lL3, lcL3, mL1, nL1, s3, l4, m4, n4;
  static int minlhs = 1, maxlhs = 1, minrhs = 3, maxrhs = 3;
  char **Str2;
  static char *Str[]= { "hm","dims","entries"};
  int mL=3, nL=1, ms=1, ns=3, mi=1, ni=3;
  int r, c, s, zero, inc, mn, row, col, sli, r2;
  //SciIntMat M;
  int si[3];
  double *temp, *var3, *var2;
  int errCode;
  int readFlag;
  double *input1;
  int *int_input2;
  int *int_input3;
  char * input_string1 = NULL;
  double *output1;
  int ndims1;
  int *dims1;
  /* Input Validation */
  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);
  /* Get Input */
  // GetRhsVar(1,"m",&m1,&n1,&l1);
  // CheckLength(1,m1,3);
  // GetListRhsVar(1,1,"S",&mL1,&nL1,&Str2);
  //
  // if ( strcmp(Str2[0],"hm") != 0)
  //   {
  //     Scierror(999,"Argument %d is not an hypermatrix\r\n",1);
  //     return 0;
  //   }
  // FreeRhsSVar(Str2);
  // GetListRhsVar(1,2,"I",&mL2,&nL2,&M);
  // GetListRhsCVar(1,3,"d",&it3,&mL3,&nL3,&lL3,&lcL3);
  readFlag = swt_gwsupport_GetRealHypermatofdouble (pvApiCtx, fname, 1,  &dims1 , &ndims1 , &input1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
    if ((ndims1 != 3))
      {
        Scierror(999,"Argument %d dimension error\r\n",1);
        return 0;
      }

    //GetRhsVar (2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 2,  &m2, &n2, &int_input2);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
  if ((int_input2[0] != 1) && (int_input2[0] != 2) && (int_input2[0] != 3) &&
      (int_input2[0] != 4) && (int_input2[0] != 5) && (int_input2[0] != 0))
    {
      sciprint("the second argument should be integer from 1 to 6!\n");
      return 0;
    }

  //GetRhsVar (3, "i", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 3,  &m3, &n3, &int_input3);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
  if ((int_input3[0] != 0) && (int_input3[0] != 1) )
    {
      sciprint("the second argument should be integer 1 or 0!\n");
      return 0;
    }

  // if (it3 == 1)
  //   {
  //     Scierror(999,"Argument %d should be real hypermatrix\r\n",1);
  //     return 0;
  //   }
  // if ((mL2 != 1) || (nL2 != 3))
  //   {
  //     Scierror(999,"Argument %d dimension error\r\n",1);
  //     return 0;
  //   }

  // mn = mL2*nL2;
  // inc  = 1;
  // zero = 0;
  //
  // temp = malloc(m1*n1*sizeof(double));
  // C2F(tpconv)(&M.it,&zero,&mn, M.D, &inc, temp, &inc);
  // row = (int)temp[0];
  // col = (int)temp[1];
  // sli = (int)temp[2];
  row = dims1[0];
  col = dims1[1];
  sli = dims1[2];
  if (int_input3[0]==0)
    {
      switch (int_input2[0])
	{
	case 0:
	  {
	    m4 = (int)dims1[0];
	    n4 = (int)dims1[1];
	    s4 = (int)dims1[2];
	    break;
	  }
	case 1:
	  {
	    m4 = (int)dims1[1];
	    n4 = (int)dims1[0];
	    s4 = (int)dims1[2];
	    break;
	  }
	case 2:
	  {
	    m4 = (int)dims1[0];
	    n4 = (int)dims1[2];
	    s4 = (int)dims1[1];
	    break;
	  }
	case 3:
	  {
	    m4 = (int)dims1[2];
	    n4 = (int)dims1[0];
	    s4 = (int)dims1[1];
	    break;
	  }
	case 4:
	  {
	    m4 = (int)dims1[1];
	    n4 = (int)dims1[2];
	    s4 = (int)dims1[0];
	    break;
	  }
	case 5:
	  {
	    m4 = (int)dims1[2];
	    n4 = (int)dims1[1];
	    s4 = (int)dims1[0];
	    break;
	  }
	default:break;
	}
    }
  else
    {

      switch (int_input2[0])
	{
	case 0:
	  {
	    m4 = (int)dims1[0];
	    n4 = (int)dims1[1];
	    s4 = (int)dims1[2];
	    break;
	  }
	case 1:
	  {
	    m4 = (int)dims1[1];
	    n4 = (int)dims1[0];
	    s4 = (int)dims1[2];
	    break;
	  }
	case 2:
	  {
	    m4 = (int)dims1[0];
	    n4 = (int)dims1[2];
	    s4 = (int)dims1[1];
	    break;
	  }
	case 3:
	  {
	    m4 = (int)dims1[1];
	    n4 = (int)dims1[2];
	    s4 = (int)dims1[0];
	    break;
	  }
	case 4:
	  {
	    m4 = (int)dims1[2];
	    n4 = (int)dims1[0];
	    s4 = (int)dims1[1];
	    break;
	  }
	case 5:
	  {
	    m4 = (int)dims1[2];
	    n4 = (int)dims1[1];
	    s4 = (int)dims1[0];
	    break;
	  }
	default:break;
	}
    }

  si[0] = m4;
  si[1] = n4;
  si[2] = s4;
  //si[3] = 8;
  // ssi.m = 1;
  // ssi.n = 3;
  // ssi.it = 4;
  // ssi.l = 100;
  // ssi.D = si;
  m4 = m4*n4*s4;
  n4 = 1;
  var3 = malloc(m4*n4*sizeof(double));

  if (int_input3[0]==0)
    {
      switch (int_input2[0])
	{
	case 0:
	  {
	    verbatim_copy (input1, row*col*sli, var3, row*col*sli);
	    break;
	  }
	case 1:
	  {
	    dwt3d_tran(input1, col, row, sli, var3, row, col, sli);
	    break;
	  }
	case 2:
	  {
	    var2 = malloc(m4*n4*sizeof(double));
	    dwt3d_tran_z(input1, col, row, sli, var2, row, sli, col);
	    dwt3d_tran(var2, row, sli, col, var3, sli, row, col);
	    free(var2);
	    break;
	  }
	case 3:
	  {
	    dwt3d_tran_z(input1, col, row, sli, var3, row, sli, col);
	    break;
	  }
	case 4:
	  {
	    var2 = malloc(m4*n4*sizeof(double));
	    dwt3d_tran(input1, col, row, sli, var3, row, col, sli);
	    dwt3d_tran_z(var3, row, col, sli, var2, col, sli, row);
	    dwt3d_tran(var2, col, sli, row, var3, sli, col, row);
	    free(var2);
	    break;
	  }
	case 5:
	  {
	    var2 = malloc(m4*n4*sizeof(double));
	    dwt3d_tran(input1, col, row, sli, var2, row, col, sli);
	    dwt3d_tran_z(var2, row, col, sli, var3, col, sli, row);
	    free(var2);
	    break;
	  }
	default:break;
	}
    }
  else
    {
      switch (int_input2[0])
	{
	case 0:
	  {
	    verbatim_copy (input1, row*col*sli, var3, row*col*sli);
	    break;
	  }
	case 1:
	  {
	    dwt3d_tran(input1, col, row, sli, var3, row, col, sli);
	    break;
	  }
	case 2:
	  {
	    var2 = malloc(m4*n4*sizeof(double));
	    dwt3d_tran(input1, col, row, sli, var2, row, col, sli);
	    dwt3d_tran_z_inv(var2, row, col, sli, var3, row, sli, col);
	    free(var2);
	    break;
	  }
	case 3:
	  {
	    dwt3d_tran_z_inv(input1, col, row, sli, var3, col, sli, row);
	    break;
	  }
	case 4:
	  {
	    dwt3d_tran_z(input1, col, row, sli, var3, col, sli, row);
	    break;
	  }
	case 5:
	  {
	    var2 = malloc(m4*n4*sizeof(double));
	    dwt3d_tran(input1, col, row, sli, var2, row, col, sli);
	    dwt3d_tran_z(var2, row, col, sli, var3, row, sli, col);
	    free(var2);
	    break;
	  }
	default:break;
	}
    }


  // CreateVar(4, "m", &mL, &nL, &l4);
  // CreateListVarFromPtr(4,1,"S",&ms,&ns,Str);
  // CreateListVarFromPtr(4,2,"I",&mi,&ni,&ssi);
  // CreateListVarFromPtr(4,3,"d",&m4, &n4, &var3);
  readFlag = swt_gwsupport_CreateHypermatOfDouble (pvApiCtx, fname, 1,  si , 3 , var3 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  free(var3);
  //AssignOutputVariable(pvApiCtx,1) = 4;

  return 0;
}

int
int_wrev3 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int l1, m1, n1, l2, m2, n2, l3, m3, n3, mL2, nL2, s4;
  static int it3, mL3, nL3, lL3, lcL3, mL1, nL1, s3, l4, m4, n4;
  static int minlhs = 1, maxlhs = 1, minrhs = 2, maxrhs = 2;
  char **Str2;
  static char *Str[]= { "hm","dims","entries"};
  int mL=3, nL=1, ms=1, ns=3, mi=1, ni=3;
  int r, c, s, zero, inc, mn, row, col, sli, r2, i;
  //SciIntMat  M;
  int si[3];
  double *temp, *var3, *var2;
  int errCode;
  int readFlag;
  double *input1;
  int *int_input2;
  int *int_input3;
  char * input_string1 = NULL;
  double *output1;
  int *dims1;
  int ndims1;
  /* Input Validation */
  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);
  /* Get Input */
  // GetRhsVar(1,"m",&m1,&n1,&l1);
  // CheckLength(1,m1,3);
  // GetListRhsVar(1,1,"S",&mL1,&nL1,&Str2);
  //
  // if ( strcmp(Str2[0],"hm") != 0)
  //   {
  //     Scierror(999,"Argument %d is not an hypermatrix\r\n",1);
  //     return 0;
  //   }
  // FreeRhsSVar(Str2);
  // GetListRhsVar(1,2,"I",&mL2,&nL2,&M);
  // GetListRhsCVar(1,3,"d",&it3,&mL3,&nL3,&lL3,&lcL3);
  readFlag = swt_gwsupport_GetRealHypermatofdouble (pvApiCtx, fname, 1,  &dims1 , &ndims1 , &input1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
    if ((ndims1 != 3))
      {
        Scierror(999,"Argument %d dimension error\r\n",1);
        return 0;
      }

    //GetRhsVar (2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 2,  &m2, &n2, &int_input2);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
  if ((int_input2[0] != 1) && (int_input2[0] != 2) && (int_input2[0] != 3) &&
      (int_input2[0] != 4) && (int_input2[0] != 5) && (int_input2[0] != 6) && int_input2[0] != 7)
    {
      sciprint("the second argument should be integer from 1 to 7!\n");
      return 0;
    }

  // if (it3 == 1)
  //   {
  //     Scierror(999,"Argument %d should be real hypermatrix\r\n",1);
  //     return 0;
  //   }
  // if ((mL2 != 1) || (nL2 != 3))
  //   {
  //     Scierror(999,"Argument %d dimension error\r\n",1);
  //     return 0;
  //   }

  // mn = mL2*nL2;
  // inc  = 1;
  // zero = 0;
  //
  // temp = malloc(m1*n1*sizeof(double));
  // C2F(tpconv)(&M.it,&zero,&mn, M.D, &inc, temp, &inc);
  // row = (int)temp[0];
  // col = (int)temp[1];
  // sli = (int)temp[2];
  // free(temp);
  row = dims1[0];
  col = dims1[1];
  sli = dims1[2];


  m3 = row;
  n3 = col;
  s3 = sli;

  si[0] = m3;
  si[1] = n3;
  si[2] = s3;

  // ssi.m = 1;
  // ssi.n = 3;
  // ssi.it = 4;
  // ssi.l = 100;
  // ssi.D = si;
  m3 = m3*n3*s3;
  n3 = 1;
  var3 = malloc(m3*n3*sizeof(double));

  switch(int_input2[0])
    {
    case 1:
      {
	dwt3d_tran(input1, col, row, sli, var3, row, col, sli);
	var2 = malloc(m3*n3*sizeof(double));
	for(i=0;i<row*sli;i++)
	  wrev(var3+i*col,col,var2+i*col,col);
	dwt3d_tran(var2, row, col, sli, var3, col, row, sli);
	free(var2);
	break;
      }
    case 2:
      {
	for(i=0;i<col*sli;i++)
	  wrev(input1+i*row,row,var3+i*row,row);
	break;
      }
    case 3:
      {
	dwt3d_tran_z(input1, col, row, sli, var3, row, sli, col);
	var2 = malloc(m3*n3*sizeof(double));
	for(i=0;i<row*col;i++)
	  wrev(var3+i*sli,sli,var2+i*sli,sli);
	dwt3d_tran_z_inv(var2, row, sli, col, var3, col, row, sli);
	free(var2);
	break;
      }
    case 4:
      {
	var2 = malloc(m3*n3*sizeof(double));
	dwt3d_tran(input1, col, row, sli, var2, row, col, sli);
	for(i=0;i<row*sli;i++)
	  wrev(var2+i*col,col,var3+i*col,col);
	dwt3d_tran(var3, row, col, sli, var2, col, row, sli);
	for(i=0;i<col*sli;i++)
	  wrev(var2+i*row,row,var3+i*row,row);
	free(var2);
	break;
      }
    case 5:
      {
	var2 = malloc(m3*n3*sizeof(double));
	dwt3d_tran(input1, col, row, sli, var2, row, col, sli);
	for(i=0;i<row*sli;i++)
	  wrev(var2+i*col,col,var3+i*col,col);
	dwt3d_tran(var3, row, col, sli, var2, col, row, sli);
	dwt3d_tran_z(var2, col, row, sli, var3, row, sli, col);
	for(i=0;i<row*col;i++)
	  wrev(var3+i*sli,sli,var2+i*sli,sli);
	dwt3d_tran_z_inv(var2, row, sli, col, var3, col, row, sli);
	free(var2);
	break;
      }
    case 6:
      {
	var2 = malloc(m3*n3*sizeof(double));
	for(i=0;i<col*sli;i++)
	  wrev(input1+i*row,row,var2+i*row,row);
	dwt3d_tran_z(var2, col, row, sli, var3, row, sli, col);
	for(i=0;i<row*col;i++)
	  wrev(var3+i*sli,sli,var2+i*sli,sli);
	dwt3d_tran_z_inv(var2, row, sli, col, var3, col, row, sli);
	free(var2);
	break;
      }
    case 7:
      {
	var2 = malloc(m3*n3*sizeof(double));
	for(i=0;i<col*sli;i++)
	  wrev(input1+i*row,row,var3+i*row,row);
	dwt3d_tran_z(var3, col, row, sli, var2, row, sli, col);
	for(i=0;i<row*col;i++)
	  wrev(var2+i*sli,sli,var3+i*sli,sli);
	dwt3d_tran_z_inv(var3, row, sli, col, var2, col, row, sli);
	dwt3d_tran(var2, col, row, sli, var3, row, col, sli);
	for(i=0;i<row*sli;i++)
	  wrev(var3+i*col,col,var2+i*col,col);
	dwt3d_tran(var2, row, col, sli, var3, col, row, sli);
	free(var2);
	break;
      }
    default:break;
    }

  // CreateVar(3, "m", &mL, &nL, &l3);
  // CreateListVarFromPtr(3,1,"S",&ms,&ns,Str);
  // CreateListVarFromPtr(3,2,"I",&mi,&ni,&ssi);
  // CreateListVarFromPtr(3,3,"d",&m3, &n3, &var3);
  readFlag = swt_gwsupport_CreateHypermatOfDouble (pvApiCtx, fname, 1,  si , 3 , var3 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  free(var3);
  //AssignOutputVariable(pvApiCtx,1) = 3;

  return 0;
}

int
int_wrev2
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int m1, n1, m2, n2, m3, n3;
  static int minlhs=1, maxlhs=1, minrhs=2, maxrhs=2;
  int i, errCode;
  double *var;
  double *input1;
  int *int_input2;
  double *output1;
  int readFlag;

  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  wrev2_form_validate (pvApiCtx, &errCode, Rhs);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

    //GetRhsVar (1, "d", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
    //GetRhsVar (2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 2,  &m2, &n2, &int_input2);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }

  if ((int_input2[0] != 1) && (int_input2[0] != 2) && (int_input2[0] != 3))
    {
      sciprint("second argument should be integer from 1 to 3!\n");
      return 0;
    }


  m3 = m1;
  n3 = n1;

    //CreateVar (3, "d", &m3, &n3, &l3);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }

  switch(int_input2[0])
    {
    case 1:
      {
	var = malloc(m1*n1*sizeof(double));
	matrix_tran(input1,n1,m1,output1,m1,n1);
	for(i=0;i<m1;i++)
	  wrev(output1+i*n1,n1,var+i*n1,n1);
	matrix_tran(var,m1,n1,output1,n1,m1);
	free(var);
	break;
      }
    case 2:
      {
	for(i=0;i<n1;i++)
	  wrev(input1+i*m1,m1,output1+i*m1,m1);
	break;
      }
    case 3:
      {
	var = malloc(m1*n1*sizeof(double));
	for(i=0;i<n1;i++)
	  wrev(input1+i*m1,m1,var+i*m1,m1);
	matrix_tran(var,n1,m1,output1,m1,n1);
	for(i=0;i<m1;i++)
	  wrev(output1+i*n1,n1,var+i*n1,n1);
	matrix_tran(var,m1,n1,output1,n1,m1);
	free(var);
	break;
      }
    default: break;
    }

  //AssignOutputVariable(pvApiCtx,1) = 3;

  return 0;
}

int
int_wnorm 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int l1, m1, n1, l2, m2, n2, l3, m3, n3, l4, m4, n4;
  static int minlhs = 1, maxlhs = 1, minrhs = 1, maxrhs = 3;
  int errCode, flow;
  int readFlag;
  double *input1;
  int *int_input2;
  int *int_input3;
  double *input2;
  double *input3;
  char * input_string1 = NULL;
  double *output1;
  /* Input Validation */
  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  /* Get Input */
    //GetRhsVar (1, "d", &m1, &n1, &l1);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  flow = 1;
  wnorm_form_validate (pvApiCtx, &flow, &errCode, Rhs);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);	/* Indicate error  */
      return 0;			/* Stop when validation fails */
    }

  switch (flow){
  case 1:
    {
      m2 = m1;
      n2 = n1;
            //CreateVar (2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m2 , n2 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      wcodematd(input1, m1*n1, output1, m2*n2, 0.0, 1.0);
      //AssignOutputVariable(pvApiCtx,1) = 2;
      break;
    }
  case 2:
    {
      m4 = m1;
      n4 = n1;
      //GetRhsVar (2, "d", &m2, &n2, &l2);
  readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 2,  &m2, &n2, &input2);
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
      //GetRhsVar (3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 3,  &m3, &n3, &input3);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar (4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      if (input2[0] >= input3[0])
	{
	  Scierror(999,"min value must be smaller than max value!\n");
	  return 0;
	}
      wcodematd(input1, m1*n1, output1, m4*n4, input2[0], input3[0]);
    //AssignOutputVariable(pvApiCtx,1) = 4;
      break;
    }
  default:break;
      }

  return 0;
}


int
int_waveletfamilies 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
    int l1, m1, n1;
   int minlhs = 1, maxlhs = 1, minrhs = 0, maxrhs = 1;
  int errCode, flow;
     int readFlag;
   char * input_string = NULL;
  int i,j,count;
  /* Input Validation */
  CheckInputArgument(pvApiCtx,minrhs, maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs, maxlhs);

  if (Rhs==0) {
    input_string = malloc(2 * sizeof(char));
    input_string[0]='f';
//     sciprint ("------------------------------------\n");
//     sciprint (" HAAR\t\t haar\t ORTH\n");
//  sciprint ("DAUBECHIES\t  db\t ORTH\n");
//  sciprint ("COIFLETS\t coif\t ORTH\n");
//  sciprint ("SYMLETS\t\t sym\t ORTH\n");
//  sciprint ("SPLINE_BIORTH\t bior\t BIORTH\n");
//   sciprint ("SPLINE_RBIORTH\t rbior\t BIORTH\n");
//  sciprint ("BEYLKIN\t\t beylkin\t ORTH\n");
//  sciprint ("VAIDYANATHAN\t vaidyanathan\t ORTH\n");
//  sciprint ("DMEY\t\t dmey\t ORTH\n");
//  sciprint ("BATHLETS\t bath\t ORTH\n");
//  sciprint ("LEGENDRE\t legd\t ORTH\n");
//  sciprint ("FARRAS\t\t fa\t ORTH\n");
//  sciprint ("KINGSBURYQ\t ksq\t ORTH\n");
//  sciprint ("------------------------------------\n");
//  sciprint ("SINUS\t\t sinus\t REAL\n");
//  sciprint ("POISSON\t\t poisson\t REAL\n");
//  sciprint ("MEXICAN_HAT\t mexh\t REAL\n");
//  sciprint ("MORLET\t\t morl\t REAL\n");
//  sciprint ("DOGAUSS\t\t DOG\t REAL\n");
//  sciprint ("GAUSS\t\t gaus\t REAL\n");
//  sciprint ("CMORLET\t\t cmor\t COMPLEX\n");
//  sciprint ("SHANNON\t\t shan\t COMPLEX\n");
//  sciprint ("FBSP\t\t fbsp\t COMPLEX\n");
//  sciprint ("CAUCHY\t\t cauchy\t COMPLEX\n");
//  sciprint ("CGAUSS\t\t cgau\t COMPLEX\n");
//  sciprint ("------------------------------------\n");

  //  return 0;

  } else {
  //   GetRhsVar (1, "c", &m1, &n1, &l1);
     readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname,1 , &input_string );
     m1=1;n1=1;
     if(readFlag==SWT_GWSUPPORT_ERROR)
       {
         return 0;
       }
   }
     if (input_string[0]=='n') {

      for (j=0;j<waveletFamilyIdentityNum;j++){
	count=0;
	sciprint (wif[j].family);
	sciprint ("\t\t\t");
	sciprint (wif[j].wname);

	sciprint ("\n------------------------------------\n");
       for (i=0;i<waveletIdentityNum;i++) {
	 if (wi[i].family==j){
	   sciprint (wi[i].wname);
	   sciprint (" ");
	   if (count%5==0 && count>4)
	      sciprint ("\n");
	   count=count+1;
	 }
       }
        sciprint ("\n------------------------------------\n");
      }


       for (j=0;j<cwtFamilyNum;j++){
	count=0;
	sciprint (cif[j].family);
	sciprint ("\t\t\t");
	sciprint (cif[j].wname);

	sciprint ("\n------------------------------------\n");
       for (i=0;i<cwtIdentityNum;i++) {
	 if (ci[i].family==j){
	   sciprint (ci[i].wname);
	   sciprint (" ");
	   if (count%5==0 && count>4)
	      sciprint ("\n");
	   count=count+1;
	 }
       }
        sciprint ("\n------------------------------------\n");
      }
     } else if (input_string[0]=='f') {
           sciprint ("------------------------------------\n");
    sciprint (" HAAR\t\t haar\t ORTH\n");
 sciprint ("DAUBECHIES\t  db\t ORTH\n");
 sciprint ("COIFLETS\t coif\t ORTH\n");
 sciprint ("SYMLETS\t\t sym\t ORTH\n");
 sciprint ("SPLINE_BIORTH\t bior\t BIORTH\n");
  sciprint ("SPLINE_RBIORTH\t rbior\t BIORTH\n");
 sciprint ("BEYLKIN\t\t beylkin\t ORTH\n");
 sciprint ("VAIDYANATHAN\t vaidyanathan\t ORTH\n");
 sciprint ("DMEY\t\t dmey\t ORTH\n");
 sciprint ("BATHLETS\t bath\t ORTH\n");
 sciprint ("LEGENDRE\t legd\t ORTH\n");
 sciprint ("FARRAS\t\t fa\t ORTH\n");
 sciprint ("KINGSBURYQ\t ksq\t ORTH\n");
 sciprint ("------------------------------------\n");
 sciprint ("SINUS\t\t sinus\t REAL\n");
 sciprint ("POISSON\t\t poisson\t REAL\n");
 sciprint ("MEXICAN_HAT\t mexh\t REAL\n");
 sciprint ("MORLET\t\t morl\t REAL\n");
 sciprint ("DOGAUSS\t\t DOG\t REAL\n");
 sciprint ("GAUSS\t\t gaus\t REAL\n");
 sciprint ("CMORLET\t\t cmor\t COMPLEX\n");
 sciprint ("SHANNON\t\t shan\t COMPLEX\n");
 sciprint ("FBSP\t\t fbsp\t COMPLEX\n");
 sciprint ("CAUCHY\t\t cauchy\t COMPLEX\n");
 sciprint ("CGAUSS\t\t cgau\t COMPLEX\n");
 sciprint ("------------------------------------\n");
  }

     	  if (input_string != NULL)
    freeAllocatedSingleString(input_string);
  return 0;

}
