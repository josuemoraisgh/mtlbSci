  /*
 * -------------------------------------------------------------------------
 * dwt1d_int.c -- 1-D signal decomposition and reconstruction interface
 * SWT - Scilab wavelet toolbox
 * Copyright (C) 2005-2006  Roger Liu
 * Copyright (C) 2010-2014  Holger Nahrstaedt
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

int
int_dwt
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int m1, n1, m2, n2, m3, n3;
  static int m4, n4, m5, n5, m6, n6;
  static int m7, n7, minlhs=2, maxlhs=2, minrhs=2, maxrhs=5;
  int errCode, flow, family, member, ii, stride, val;
  Func ana_fun;
  swt_wavelet pWaveStruct;
  extend_method extMethod;

  int readFlag;
  double *input1 = NULL;
  double *input2 = NULL;
  double *input3 = NULL;
  double *input4 = NULL;
  double *input5 = NULL;

  char * input_string1 = NULL;
  char * input_string2 = NULL;
  char * input_string3 = NULL;
  char * input_string4 = NULL;
  char * input_string5 = NULL;
  char * input_string6 = NULL;
  double *output1 = NULL;
  double *output2 = NULL;
  double *output3 = NULL;
  double *output4 = NULL;
  double *output5 = NULL;

  CheckInputArgument(pvApiCtx,minrhs,maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs,maxlhs);

  //GetRhsVar(1, "d", &m1, &n1, &l1);

  dwt_form_validate (pvApiCtx, &errCode,&flow,Rhs);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
	  //sciprint("right here!\n");
      return 0;
    }

  //CheckOutputArgument(pvApiCtx,minlhs,maxlhs);



  switch (flow){
  case 1:
    {
      //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
      if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        	return 0;
      }

      //GetRhsVar(2, "c", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 2 , &input_string2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      dwt_content_validate (pvApiCtx, &errCode,flow,input_string2,input_string3,input_string4);

      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wavelet_parser(input_string2,&family,&member);
      wavelet_fun_parser (input_string2, &ii);
      ana_fun = wi[ii].analysis;
      (*ana_fun)(member, &pWaveStruct);
      wave_len_validate ( m1*n1, pWaveStruct.length,
			 &stride, &val);

      if (!val)
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      m3 = 1;
      m4 = 1;
      n3 = (int)floor((m1*n1 + pWaveStruct.length - 1)/2);
      if (getdwtMode()==PER)
	     n3 = (int)ceil(((double)(m1*n1))/2.0);
      n4 = n3;
      //CreateVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m4 , n4 , &output2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }

	  dwt_neo (input1, m1*n1, pWaveStruct.pLowPass,
	   pWaveStruct.pHiPass, pWaveStruct.length,
	   output1, output2, n3, getdwtMode());
      filter_clear();
      //AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;
      //AssignOutputVariable(pvApiCtx,2) = nbInputArgument(pvApiCtx) + 2;
      break;
    }
  case 2:
    {
      //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 2,  &m2, &n2, &input2);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 3,  &m3, &n3, &input3);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        dwt_content_validate (pvApiCtx, &errCode,flow,input_string2,input_string3,input_string4);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wave_len_validate ( m1*n1, m3*n3, &stride, &val);
      if (!val)
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      m4 = 1;
      m5 = 1;
      n4 = (int)floor((m1*n1 + m2*n2 - 1)/2);
      if (getdwtMode()==PER)
         n4 = (int)ceil(((double)(m1*n1))/2.0);
      n5 = n4;
      //CreateVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m5 , n5 , &output2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      dwt_neo (input1, m1*n1, input2, input3, m2*n2,
	   output1, output2, n4, getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 4;
      //AssignOutputVariable(pvApiCtx,2) = 5;
      break;
    }
  case 3:
    {
      //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }

      //GetRhsVar(2, "c", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 2 , &input_string2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "c", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 3 , &input_string3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "c", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 4 , &input_string4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      dwt_content_validate (pvApiCtx, &errCode,flow,input_string2,input_string3,input_string4);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      //dwt_write(cstk(l4),&errCode);
      extend_method_parse (input_string4, &extMethod);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wavelet_parser(input_string2,&family,&member);
      wavelet_fun_parser (input_string2, &ii);
      ana_fun = wi[ii].analysis;
      (*ana_fun)(member, &pWaveStruct);
      wave_len_validate ( m1*n1, pWaveStruct.length,
			 &stride, &val);
      if (!val)
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      m5 = 1;
      m6 = 1;
      n5 = (int)floor((m1*n1 + pWaveStruct.length - 1)/2);
      if (extMethod==PER)
        n5 = (int)ceil(((double)(m1*n1))/2.0);
      n6 = n5;
      //CreateVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m6 , n6 , &output2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      dwt_neo (input1, m1*n1, pWaveStruct.pLowPass,
	   pWaveStruct.pHiPass, pWaveStruct.length,
	   output1, output2, n5, extMethod);
      //AssignOutputVariable(pvApiCtx,1) = 5;
      //AssignOutputVariable(pvApiCtx,2) = 6;
      filter_clear();
      break;
    }
  case 4:
    {
      //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 2,  &m2, &n2, &input2);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 3,  &m3, &n3, &input3);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "c", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 4 , &input_string4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(5, "c", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 5 , &input_string5 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      dwt_content_validate (pvApiCtx, &errCode,flow,input_string1,input_string2,input_string3);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      //dwt_write(cstk(l4),&errCode);
      extend_method_parse (input_string4, &extMethod);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wave_len_validate ( m1*n1, m3*n3, &stride, &val);
      if (!val)
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      m6 = 1;
      m7 = 1;
      n6 = (int)floor((m1*n1 + m2*n2 - 1)/2);
      if (extMethod==PER)
         n6 = (int)ceil(((double)(m1*n1))/2.0);
      n7 = n6;
      //CreateVar(6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m6 , n6 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(7, "d", &m7, &n7, &l7);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m7 , n7 , &output2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      dwt_neo (input1, m1*n1, input2, input3, m2*n2,
	   output1, output2, n6, extMethod);
      //AssignOutputVariable(pvApiCtx,1) = 6;
      //AssignOutputVariable(pvApiCtx,2) = 7;
      break;
    }
  default:
    break;
  }

  //sciprint("flow=%d\n", flow);
  return 0;
}

int
int_idwt 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int m1, n1, m2, n2, m3, n3, m4, n4;
  static int m5, n5, m6, n6, m7, n7, m8, n8;
  static minlhs=1, maxlhs=1, minrhs=3, maxrhs=7;
  int errCode, flow, family, member, ii, stride, val;
  Func syn_fun;
  swt_wavelet pWaveStruct;
  extend_method extMethod;

  int readFlag;
  double *input1;
  double *input2;
  double *input3;
  double *input4;
  double *input5;
  int *int_input1;
  int *int_input2;
  int *int_input3;
  int *int_input4;
  int *int_input5;

  char * input_string1 = NULL;
  char * input_string2 = NULL;
  char * input_string3 = NULL;
  char * input_string4 = NULL;
  char * input_string5 = NULL;
  char * input_string6 = NULL;
  char * input_string7 = NULL;

  double *output1;



  CheckInputArgument(pvApiCtx,minrhs,maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs,maxlhs);

  idwt_form_validate (pvApiCtx, &errCode,&flow,Rhs);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }



  switch (flow) {
  case 1:
    {
            //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
            //GetRhsVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "c", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 3 , &input_string3 );
      m3=1;n3=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      errCode = SUCCESS;
      //idwt_content_validate (pvApiCtx, &errCode,flow,l1,l2,l3,l4,l5,l6,l7);
      wfilters_content_validate (pvApiCtx, &errCode, input_string3);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wavelet_parser(input_string3,&family,&member);
      wavelet_fun_parser (input_string3, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      wave_len_validate ( (m1*n1>0)?(m1*n1):(m2*n2),
			 pWaveStruct.length, &stride, &val);
      if (!val)
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      m4 = 1;
      if (m1*n1 != 0)// && (getdwtMode()!=PER))
	n4 = m1*n1*2 - pWaveStruct.length + 2;
      if ((m1*n1 != 0) && (getdwtMode()==PER))
         n4 = m1*n1*2;
      if (m1*n1 == 0)// && (getdwtMode()!=PER))
	n4 = m2*n2*2 - pWaveStruct.length + 2;
      if ((m1*n1 == 0) && (getdwtMode()==PER))
         n4 = m2*n2*2;
      //CreateVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      if ((m1*n1==0) && (m2*n2!=0))
	idwt_detail_neo (input2, m2*n2, pWaveStruct.pHiPass,
			pWaveStruct.length, output1, m4*n4);
      else if ((m1*n1!=0) && (m2*n2==0))
	idwt_approx_neo (input1, m1*n1, pWaveStruct.pLowPass,
		     pWaveStruct.length, output1, m4*n4);
      else if ((m1*n1!=0) && (m2*n2!=0))
	idwt_neo (input1, input2, m1*n1,
			  pWaveStruct.pLowPass, pWaveStruct.pHiPass,
			  pWaveStruct.length, output1, m4*n4);
      else
	{
	  errCode=UNKNOWN_INPUT_ERR;
	  validate_print (errCode);
	  return 0;
	}
      //AssignOutputVariable(pvApiCtx,1) = 4;
      filter_clear();
      break;
    }
  case 2:
    {
            //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
            //GetRhsVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 3,  &m3, &n3 , &input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 4,  &m4, &n4 , &input4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      idwt_content_validate (pvApiCtx, &errCode,flow,   NULL, NULL, NULL, NULL, NULL, NULL, NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wave_len_validate ( (m1*n1>0)?(m1*n1):(m2*n2),
			 (m3*n3), &stride, &val);
      if (!val)
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      m5 = 1;
      if (m1*n1 != 0)// && (getdwtMode()!=PER))
	n5 = m1*n1*2 - m3*n3 + 2;
      if ((m1*n1 != 0) && (getdwtMode()==PER))
        n5 = m1*n1*2;
      if (m1*n1 == 0) //&& (getdwtMode()!=PER))
	n5 = m2*n2*2 - m3*n3 + 2;
      if ((m1*n1 == 0) && (getdwtMode()==PER))
        n5 = m2*n2*2;
      //CreateVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      if ((m1*n1==0) && (m2*n2!=0))
	idwt_detail_neo (input2, m2*n2, input4,
		     n4*m4, output1, m5*n5);
      else if ((m1*n1!=0) && (m2*n2==0))
	idwt_approx_neo (input1, m1*n1, input3,
			n3*m3, output1, m5*n5);
      else if ((m1*n1!=0) && (m2*n2!=0))
	idwt_neo (input1, input2, m1*n1,
  input3, input4,  m3*n3, output1, m5*n5);
      else
	{
	  errCode=UNKNOWN_INPUT_ERR;
	  validate_print (errCode);
	  return 0;
	}
      //AssignOutputVariable(pvApiCtx,1) = 5;
      break;
    }
  case 3:
    {
            //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "c", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 3 , &input_string3 );
      m3=1;n3=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "i", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 4,  &m4, &n4 , &int_input4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      idwt_content_validate (pvApiCtx, &errCode,flow,   input_string3, int_input4, NULL, NULL, NULL, NULL, NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wavelet_parser(input_string3,&family,&member);
      wavelet_fun_parser (input_string3, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      wave_len_validate ( (m1*n1>0)?(m1*n1):(m2*n2),
			 pWaveStruct.length, &stride, &val);
      if (!val)
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      m5 = 1;
      n5 = int_input4[0];
      /*if (n5 > (((m1*n1>0)?(m1*n1):(m2*n2))*2 +
		pWaveStruct.length - 1))
	{
	  sciprint("Length Parameter is not valid for input vector!\n");
	  return 0;
	}*/
	  if (n5 > (((m1*n1>0)?(m1*n1):(m2*n2))*2 +
		pWaveStruct.length))
	{
	  sciprint("Length Parameter is not valid for input vector!\n");
	  return 0;
	}
      //CreateVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      if ((m1*n1==0) && (m2*n2!=0))
	idwt_detail_neo (input2, m2*n2, pWaveStruct.pHiPass,
			pWaveStruct.length, output1, m5*n5);
      else if ((m1*n1!=0) && (m2*n2==0))
	idwt_approx_neo (input1, m1*n1, pWaveStruct.pLowPass,
		     pWaveStruct.length, output1, m5*n5);
      else if ((m1*n1!=0) && (m2*n2!=0))
	idwt_neo (input1, input2, m1*n1,
		       pWaveStruct.pLowPass, pWaveStruct.pHiPass,
		       pWaveStruct.length, output1, m5*n5);
      else
	{
	  errCode=UNKNOWN_INPUT_ERR;
	  validate_print (errCode);
	  return 0;
	}
      //AssignOutputVariable(pvApiCtx,1) = 5;
      filter_clear();
      break;
    }
  case 4:
    {
            //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
            //GetRhsVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 3,  &m3, &n3 , &input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 4,  &m4, &n4 , &input4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(5, "i", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 5,  &m5, &n5 , &int_input5 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      idwt_content_validate (pvApiCtx, &errCode,flow,   NULL, NULL, int_input5, NULL, NULL, NULL, NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wave_len_validate ( (m1*n1>0)?(m1*n1):(m2*n2),
			 (m3*n3), &stride, &val);
      if (!val)
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      m6 = 1;
      n6 = int_input5[0];
      /*if (n6 > (((m1*n1>0)?(m1*n1):(m2*n2))*2 +
		m3*n3 - 1))
	{
	  sciprint("Length Parameter is not valid for input vector!\n");
	  return 0;
	}*/
	  if (n6 > (((m1*n1>0)?(m1*n1):(m2*n2))*2 +
		m3*n3))
	{
	  sciprint("Length Parameter is not valid for input vector!\n");
	  return 0;
	}
      //CreateVar(6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m6 , n6 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      if ((m1*n1==0) && (m2*n2!=0))
	idwt_detail_neo (input2, m2*n2, input4,
		     n4*m4, output1, m6*n6);
      else if ((m1*n1!=0) && (m2*n2==0))
	idwt_approx_neo (input1, m1*n1, input3,
			n3*m3, output1, m6*n6);
      else if ((m1*n1!=0) && (m2*n2!=0))
	idwt_neo (input1, input2, m1*n1,
		       input3, input4,
		       m3*n3, output1, m6*n6);
      else
	{
	  errCode=UNKNOWN_INPUT_ERR;
	  validate_print (errCode);
	  return 0;
	}
      //AssignOutputVariable(pvApiCtx,1) = 6;
      break;
    }
  case 5:
    {
            //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
            //GetRhsVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "c", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 3 , &input_string3 );
      m3=1;n3=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "c", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 4 , &input_string4 );
      m4=1;n4=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(5, "c", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 5 , &input_string5 );
      m5=1;n5=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      idwt_content_validate (pvApiCtx, &errCode,flow,   input_string3, NULL, NULL, input_string4, input_string5, NULL, NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wavelet_parser(input_string3,&family,&member);
      wavelet_fun_parser (input_string3, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      wave_len_validate ( (m1*n1>0)?(m1*n1):(m2*n2),
			 pWaveStruct.length, &stride, &val);
      if (!val)
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      extend_method_parse (input_string5, &extMethod);
      m6 = 1;
      if (m1*n1 != 0)// && (getdwtMode()!=PER))
	n6 = m1*n1*2 - pWaveStruct.length + 2;
      if ((m1*n1 != 0) && (extMethod==PER))
        n6 = m1*n1*2;
      if (m1*n1 == 0) //&& (getdwtMode()!=PER))
	n6 = m2*n2*2 - pWaveStruct.length + 2;
      if ((m1*n1 == 0) && (extMethod==PER))
        n6 = m2*n2*2;
      //CreateVar(6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m6 , n6 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      if ((m1*n1==0) && (m2*n2!=0))
	idwt_detail_neo (input2, m2*n2, pWaveStruct.pHiPass,
		     pWaveStruct.length, output1, m6*n6);
      else if ((m1*n1!=0) && (m2*n2==0))
	idwt_approx_neo (input1, m1*n1, pWaveStruct.pLowPass,
		     pWaveStruct.length, output1, m6*n6);
      else if ((m1*n1!=0) && (m2*n2!=0))
	idwt_neo (input1, input2, m1*n1,
		       pWaveStruct.pLowPass, pWaveStruct.pHiPass,
		       pWaveStruct.length, output1, m6*n6);
      else
	{
	  errCode=UNKNOWN_INPUT_ERR;
	  validate_print (errCode);
	  return 0;
	}
      //AssignOutputVariable(pvApiCtx,1) = 6;
      filter_clear();
      break;
    }
  case 6:
    {
            //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
            //GetRhsVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "c", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 3 , &input_string3 );
      m3=1;n3=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "i", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 4,  &m4, &n4 , &int_input4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(5, "c", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 5 , &input_string5 );
      m5=1;n5=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(6, "c", &m6, &n6, &l6);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 6 , &input_string6 );
      m6=1;n6=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }

      idwt_content_validate (pvApiCtx, &errCode,flow,   input_string3, int_input4, NULL, NULL, input_string5, input_string6, NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wavelet_parser(input_string3,&family,&member);
      wavelet_fun_parser (input_string3, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      wave_len_validate ( (m1*n1>0)?(m1*n1):(m2*n2),
			 pWaveStruct.length, &stride, &val);
      if (!val)
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      extend_method_parse (input_string6, &extMethod);
      m7 = 1;
      n7 = int_input4[0];
      /*if (n7 > (((m1*n1>0)?(m1*n1):(m2*n2))*2 +
		pWaveStruct.length - 1))
	{
	  sciprint("Length Parameter is not valid for input vector!\n");
	  return 0;
	}*/
	  if (n7 > (((m1*n1>0)?(m1*n1):(m2*n2))*2 +
		pWaveStruct.length))
	{
	  sciprint("Length Parameter is not valid for input vector!\n");
	  return 0;
	}
      //CreateVar(7, "d", &m7, &n7, &l7);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m7 , n7 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      if ((m1*n1==0) && (m2*n2!=0))
	idwt_detail_neo (input2, m2*n2, pWaveStruct.pHiPass,
			pWaveStruct.length, output1, m7*n7);
      else if ((m1*n1!=0) && (m2*n2==0))
	idwt_approx_neo (input1, m1*n1, pWaveStruct.pLowPass,
		     pWaveStruct.length, output1, m7*n7);
      else if ((m1*n1!=0) && (m2*n2!=0))
	idwt_neo (input1, input2, m1*n1,
			  pWaveStruct.pLowPass, pWaveStruct.pHiPass,
			  pWaveStruct.length, output1, m7*n7);
      else
	{
	  errCode=UNKNOWN_INPUT_ERR;
	  validate_print (errCode);
	  return 0;
	}
      //AssignOutputVariable(pvApiCtx,1) = 7;
      filter_clear();
      break;
    }
  case 7:
    {
            //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
            //GetRhsVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 3,  &m3, &n3 , &input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 4,  &m4, &n4 , &input4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(5, "c", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 5 , &input_string5 );
      m5=1;n5=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(6, "c", &m6, &n6, &l6);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 6 , &input_string6 );
      m6=1;n6=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      idwt_content_validate (pvApiCtx, &errCode,flow,   NULL, NULL, NULL,NULL, input_string5, input_string6, NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wave_len_validate ( (m1*n1>0)?(m1*n1):(m2*n2),
			 (m3*n3), &stride, &val);
      if (!val)
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      extend_method_parse (input_string6, &extMethod);
      m7 = 1;
      if (m1*n1 != 0)// && (getdwtMode()!=PER))
	n7 = m1*n1*2 - m3*n3 + 2;
      if ((m1*n1 != 0) && (extMethod==PER))
          n7 = m1*n1*2;
      if (m1*n1 == 0)// && (getdwtMode()!=PER))
	n7 = m2*n2*2 - m3*n3 + 2;
      if ((m1*n1 == 0) && (extMethod==PER))
         n7 = m2*n2*2;
      //CreateVar(7, "d", &m7, &n7, &l7);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m7 , n7 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      if ((m1*n1==0) && (m2*n2!=0))
	idwt_detail_neo (input2, m2*n2, input4,
		     n4*m4, output1, m7*n7);
      else if ((m1*n1!=0) && (m2*n2==0))
	idwt_approx_neo (input1, m1*n1, input3,
		     n3*m3, output1, m7*n7);
      else if ((m1*n1!=0) && (m2*n2!=0))
	idwt_neo (input1, input2, m1*n1,
		       input3, input4,
		       m3*n3, output1, m7*n7);
      else
	{
	  errCode=UNKNOWN_INPUT_ERR;
	  validate_print (errCode);
	  return 0;
	}
    //AssignOutputVariable(pvApiCtx,1) = 7;
      break;
    }
  case 8:
    {
            //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
            //GetRhsVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 3,  &m3, &n3 , &input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 4,  &m4, &n4 , &input4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(5, "i", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 5,  &m5, &n5 , &int_input5 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(6, "c", &m6, &n6, &l6);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 6 , &input_string6 );
      m6=1;n6=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(7, "c", &m7, &n7, &l7);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 7 , &input_string7 );
      m7=1;n7=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      idwt_content_validate (pvApiCtx, &errCode,flow, NULL, NULL, int_input5, NULL, NULL, input_string6, input_string7);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wave_len_validate ( (m1*n1>0)?(m1*n1):(m2*n2),
			 (m3*n3), &stride, &val);
      if (!val)
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      extend_method_parse (input_string7, &extMethod);
      m8 = 1;
      n8 = int_input5[0];
      /*if (n8 > (((m1*n1>0)?(m1*n1):(m2*n2))*2 +
		m3*n3 - 1))
	{
	  sciprint("Length Parameter is not valid for input vector!\n");
	  return 0;
	}*/
	  if (n8 > (((m1*n1>0)?(m1*n1):(m2*n2))*2 +
		m3*n3))
	{
	  sciprint("Length Parameter is not valid for input vector!\n");
	  return 0;
	}
      //CreateVar(8, "d", &m8, &n8, &l8);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m8 , n8 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      if ((m1*n1==0) && (m2*n2!=0))
	idwt_detail_neo (input2, m2*n2, input4,
		     n4*m4, output1, m8*n8);
      else if ((m1*n1!=0) && (m2*n2==0))
	idwt_approx_neo (input1, m1*n1, input3,
		     n3*m3, output1, m8*n8);
      else if ((m1*n1!=0) && (m2*n2!=0))
	idwt_neo (input1, input2, m1*n1,
		       input3, input4,
		       m3*n3, output1, m8*n8);//, extMethod);
      else
	{
	  errCode=UNKNOWN_INPUT_ERR;
	  validate_print (errCode);
	  return 0;
	}
      //AssignOutputVariable(pvApiCtx,1) = 8;
      break;
    }
  default:
    break;
  }

  return 0;
}



int
int_wavedec 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int m1, n1, m2, n2, m3, n3;
  static int m4, n4, m5, n5, m6, n6;
  static int minlhs=2, maxlhs=2, minrhs=3, maxrhs=4;
  int errCode, flow, stride, val, ii, family, member;
  int count, calLen, temLen;
  Func ana_fun;
  swt_wavelet pWaveStruct;

  int readFlag;
  double *input1 = NULL;
  int *input2 = NULL;
  double *input3 = NULL;
  double *input4 = NULL;
  char * input_string1 = NULL;
  double *output1;
  int *output2;

  CheckOutputArgument(pvApiCtx,minlhs,maxlhs);
  CheckInputArgument(pvApiCtx,minrhs,maxrhs);

  wavedec_form_validate (pvApiCtx, &errCode,&flow,Rhs);
  if (errCode != SUCCESS)
    {
      //sciprint("flow error!\n");
      validate_print (errCode);
      return 0;
    }




  switch (flow) {
  case 1:
    {
      //GetRhsVar(1, "d", &m1, &n1, &l1);

      readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
    //  GetRhsVar(2, "i", &m2, &n2, &l2);
    readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 2,  &m2, &n2, &input2);
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }
      //GetRhsVar(3, "c", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 3 , &input_string1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      wavedec_content_validate (pvApiCtx, &errCode,flow,input2,input_string1);


      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wavelet_parser(input_string1,&family,&member);
      wavelet_fun_parser (input_string1, &ii);
      ana_fun = wi[ii].analysis;
      (*ana_fun)(member, &pWaveStruct);
      wave_len_validate ( m1*n1, pWaveStruct.length, &stride, &val);
      if ((!val) || (stride<input2[0]))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      m4 = 1;
      m5 = 1;
      n4 = 0;
      calLen = n1 * m1;
      for (count = 0; count < input2[0]; count++)
	{
	  calLen += pWaveStruct.length - 1;
	  temLen = calLen/2;
	  n4 += temLen;
	  calLen = temLen;
	}
      n4 += temLen;
	  if (getdwtMode()==PER)
	  {
	    n4 = 0;
        calLen = n1 * m1;
        for (count = 0; count < input2[0]; count++)
	     {
	       //calLen += m3*n3 - 1;
		   calLen = (int)ceil(((double)(calLen))/2.0);
	       temLen = calLen;
	       n4 += temLen;
	       //calLen = temLen;
	     }
        n4 += temLen;
	  }
      n5 = input2[0] + 2;
      //CreateVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(5, "i", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoublesAsInteger (pvApiCtx, fname, 2,  m5 , n5 , &output2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      wave_dec_len_cal (pWaveStruct.length, m1*n1,
      (int)input2[0], output2);
      wavedec (input1, m1*n1, output1, m4*n4,
	       pWaveStruct.pLowPass, pWaveStruct.pHiPass,
	       pWaveStruct.length, output2, n5,
	       input2[0], getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 4;
      //AssignOutputVariable(pvApiCtx,2) = 5;
      //AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;
      //AssignOutputVariable(pvApiCtx,2) = nbInputArgument(pvApiCtx) + 2;
      filter_clear();
      break;
    }
  case 2:
    {
      //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 1,  &m1, &n1, &input1);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger(pvApiCtx, fname, 2,  &m2, &n2, &input2);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 3,  &m3, &n3, &input3);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles(pvApiCtx, fname, 4,  &m4, &n4, &input4);
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
	  //sciprint("after get data!\n");
      wavedec_content_validate (pvApiCtx, &errCode,flow,input2,input_string1);

      if (errCode != SUCCESS)
	{
      //sciprint("enter here\n");
	  validate_print (errCode);
	  return 0;
	}
      wave_len_validate ( m1*n1, m3*n3, &stride, &val);
      if ((!val) || (stride<input2[0]))
	{
      //sciprint("enter here!\n");
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      m5 = 1;
      m6 = 1;
      n5 = 0;
      calLen = n1 * m1;
      for (count = 0; count < input2[0]; count++)
	  {
	     calLen += m3*n3 - 1;
	     temLen = calLen/2;
	     n5 += temLen;
	     calLen = temLen;
	  }
      n5 += temLen;
	  if (getdwtMode()==PER)
	  {
	    n5 = 0;
        calLen = n1 * m1;
        for (count = 0; count < input2[0]; count++)
	     {
	       //calLen += m3*n3 - 1;
		   calLen = (int)ceil(((double)(calLen))/2.0);
	       temLen = calLen;
	       n5 += temLen;
	       //calLen = temLen;
	     }
        n5 += temLen;
	  }
      n6 = input2[0] + 2;
      //CreateVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(6, "i", &m6, &n6, &l6);
      readFlag = swt_gwsupport_AllocMatrixOfDoublesAsInteger (pvApiCtx, fname, 2,  m6 , n6 , &output2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      wave_dec_len_cal (m3*n3, m1*n1,
      input2[0], output2);
      wavedec (input1, m1*n1, output1, m5*n5, input3, input4,
	       m3*n3, output2, n6, input2[0], getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 5;
      //AssignOutputVariable(pvApiCtx,2) = 6;
      //AssignOutputVariable(pvApiCtx,1) = nbInputArgument(pvApiCtx) + 1;
      //AssignOutputVariable(pvApiCtx,2) = nbInputArgument(pvApiCtx) + 2;
      break;
    }
  default:
    break;
  }

  return 0;
}

int
int_waverec 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int m1, n1, m2, n2, m3, n3;
  static int m4, n4, m5, n5;
  static int minrhs=3, maxrhs=4, minlhs=1, maxlhs=1;
  int errCode, flow, len, count, val, family, member, ii;
  Func syn_fun;
  swt_wavelet pWaveStruct;
  int readFlag;
  double *input1;
  int *int_input2;
  double *input3;
  double *input4;
  char * input_string1 = NULL;
  double *output1;

  CheckOutputArgument(pvApiCtx,minlhs,maxlhs);
  CheckInputArgument(pvApiCtx,minrhs,maxrhs);

  waverec_form_validate (pvApiCtx, &errCode,&flow,Rhs);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }


  switch (flow) {
  case 1:
    {
      //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1 , &n1 , &input1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 2,  &m2 , &n2 , &int_input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "c", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname,3 , &input_string1 );
      m3=1;n3=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      waverec_content_validate (pvApiCtx, &errCode,flow,input_string1);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      len = 0;
      for (count = 0; count < (m2 * n2 - 1); count++)
	len += int_input2[count];
      if (len != m1 * n1)
	{
	  sciprint ("Inputs are not coef and length array!\n");
	  return 0;
	}
      val = 0;
      for (count = 0; count < (m2 * n2 - 1); count++)
	{
	  if (int_input2[count] > int_input2[count + 1])
	    {
	      val = 1;
	      break;
	    }
	}
      if (val != 0)
	{
	  sciprint ("Inputs are not coef and length array!\n");
	  return 0;
	}
      wavelet_parser(input_string1,&family,&member);
      wavelet_fun_parser (input_string1, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      if (int_input2[0] < pWaveStruct.length)
	{
	  sciprint ("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      //for(count=0;count<pWaveStruct.length;count++)
      //	printf("%f\n",pWaveStruct.pLowPass[count]);
      m4 = 1;
      n4 = int_input2[m2*n2-1];
      //CreateVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      waverec (input1, m1*n1, output1, m4*n4,
	       pWaveStruct.pLowPass, pWaveStruct.pHiPass,
	       pWaveStruct.length, int_input2, m2*n2,
	       m2*n2-2, getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 4;
      filter_clear();
      break;
    }
  case 2:
    {
      //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1 , &n1 , &input1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 2,  &m2 , &n2 , &int_input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname,3 ,  &m3 , &n3 , &input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 4,  &m4 , &n4 , &input4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        waverec_content_validate (pvApiCtx, &errCode,flow,input_string1);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      len = 0;
      for (count = 0; count < (m2 * n2 - 1); count++)
	len += int_input2[count];
      if (len != m1 * n1)
	{
	  sciprint ("Inputs are not coef and length array!\n");
	  return 0;
	}
      val = 0;
      for (count = 0; count < (m2 * n2 - 1); count++)
	{
	  if (int_input2[count] > int_input2[count + 1])
	    {
	      val = 1;
	      break;
	    }
	}
      if (val != 0)
	{
	  sciprint ("Inputs are not coef and length array!\n");
	  return 0;
	}
      if (int_input2[0] < m3*n3)
	{
	  sciprint ("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      m5 = 1;
      n5 = int_input2[m2*n2-1];
      //CreateVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      waverec (input1, m1*n1, output1, m5*n5,
      input3, input4, m3*n3, int_input2, m2*n2,
	       m2*n2-2, getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 5;
      break;
    }
  default:
    break;
  }
  return 0;
}

int
int_wrcoef 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int m1, n1,  m2, n2, m3, n3;
  static int  m4, n4,  m5, n5,  m6, n6;
  static int m7, n7;
  static int minrhs=4, maxrhs=6, minlhs=1, maxlhs=1;
  int errCode, flow, len, count, val, family, member, ii;
  Func syn_fun;
  swt_wavelet pWaveStruct;
  int readFlag;
  double *input2 = NULL;
  int *int_input2 = NULL;
  int *int_input3 = NULL;
  double *input4 = NULL;
  double *input5 = NULL;
  int *int_input5 = NULL;
  int *int_input6 = NULL;
  char * input_string1 = NULL;
  char * input_string4 = NULL;
  double *output1;
  double *output2;


  CheckInputArgument(pvApiCtx,minrhs,maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs,maxlhs);

  wrcoef_form_validate (pvApiCtx, &errCode, &flow, Rhs);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  switch (flow) {
  case 1:
    {
      //GetRhsVar(1, "c", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 1 , &input_string1 );
      m1=1;n1=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "i", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 3,  &m3 , &n3 , &int_input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "c", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 4 , &input_string4 );
      m4=1;n4=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //printf("enter flow 1\n");
      len = 0;
      for (count = 0; count < (m3 * n3 - 1); count++)
	len += int_input3[count];
      if (len != m2 * n2)
	{
	  sciprint ("Inputs are not coef and length array!\n");
	  return 0;
	}
      val = 0;
      for (count = 0; count < (m3 * n3 - 1); count++)
	{
	  if (int_input3[count] > int_input3[count + 1])
	    {
	      val = 1;
	      break;
	    }
	}
      if (val != 0)
	{
	  sciprint ("Inputs are not coef and length array!\n");
	  return 0;
	}
      //printf("before content check\n");
      wrcoef_content_validate (pvApiCtx, &errCode, flow, input_string1,   input_string4, NULL, NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      //printf("before wavelet parser\n");
      wavelet_parser(input_string4,&family,&member);
      wavelet_fun_parser (input_string4, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      //printf("after parser\n");
      if (int_input3[0] < pWaveStruct.length)
	{
	  sciprint ("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      m5 = 1;
      n5 = int_input3[m3*n3-1];
      //CreateVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //printf("before wrcoef\n");
      wrcoef (input2, m2*n2, pWaveStruct.pLowPass,
	      pWaveStruct.pHiPass, pWaveStruct.length,
	      int_input3, m3*n3, output1, m5*n5, input_string1,
	      m3*n3-2, m3*n3-2, getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 5;
      filter_clear();
      break;
    }
  case 2:
    {
      //GetRhsVar(1, "c", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 1 , &input_string1 );
      m1=1;n1=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        //GetRhsVar(2, "d", &m2, &n2, &l2);
        readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
        if(readFlag==SWT_GWSUPPORT_ERROR)
          {
            return 0;
          }
          //GetRhsVar(3, "i", &m3, &n3, &l3);
          readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 3,  &m3 , &n3 , &int_input3 );
          if(readFlag==SWT_GWSUPPORT_ERROR)
            {
              return 0;
            }
            //GetRhsVar(4, "c", &m4, &n4, &l4);
            readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 4 , &input_string4 );
            m4=1;n4=1;
            if(readFlag==SWT_GWSUPPORT_ERROR)
              {
                return 0;
              }
      //GetRhsVar(5, "i", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 5,  &m5 , &n5 , &int_input5 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      len = 0;
      for (count = 0; count < (m3 * n3 - 1); count++)
	len += int_input3[count];
      if (len != m2 * n2)
	{
	  sciprint ("Inputs are not coef and length array!\n");
	  return 0;
	}
      val = 0;
      for (count = 0; count < (m3 * n3 - 1); count++)
	{
	  if (int_input3[count] > int_input3[count + 1])
	    {
	      val = 1;
	      break;
	    }
	}
      if (val != 0)
	{
	  sciprint ("Inputs are not coef and length array!\n");
	  return 0;
	}
      wrcoef_content_validate (pvApiCtx, &errCode, flow, input_string1,     input_string4, int_input3, NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wavelet_parser(input_string4,&family,&member);
      wavelet_fun_parser (input_string4, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      if (int_input3[0] < pWaveStruct.length)
	{
	  sciprint ("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      if (int_input5[0] > (m3*n3-2))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      m6 = 1;
      n6 = int_input3[m3*n3-1];
      //CreateVar(6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m6 , n6 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      wrcoef (input2, m2*n2, pWaveStruct.pLowPass,
	      pWaveStruct.pHiPass, pWaveStruct.length,
	      int_input3, m3*n3, output1, m6*n6, input_string1,
	      m3*n3-2, int_input5[0], getdwtMode());
    //  AssignOutputVariable(pvApiCtx,1) = 6;
      filter_clear();
      break;
    }
  case 3:
    {

      //GetRhsVar(1, "c", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 1 , &input_string1 );
      m1=1;n1=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        //GetRhsVar(2, "d", &m2, &n2, &l2);
        readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
        if(readFlag==SWT_GWSUPPORT_ERROR)
          {
            return 0;
          }
          //GetRhsVar(3, "i", &m3, &n3, &l3);
          readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 3,  &m3 , &n3 , &int_input3 );
          if(readFlag==SWT_GWSUPPORT_ERROR)
            {
              return 0;
            }
          //  GetRhsVar(4, "d", &m4, &n4, &l4);
              readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 4,  &m4 , &n4 , &input4 );
              if(readFlag==SWT_GWSUPPORT_ERROR)
                {
                  return 0;
                }
    //  GetRhsVar(5, "d", &m5, &n5, &l5);
    readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 5,  &m5 , &n5 , &input5 );
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }
      len = 0;
      for (count = 0; count < (m3 * n3 - 1); count++)
	len += int_input3[count];
      if (len != m2 * n2)
	{
	  sciprint ("Inputs are not coef and length array!\n");
	  return 0;
	}
      val = 0;
      for (count = 0; count < (m3 * n3 - 1); count++)
	{
	  if (int_input3[count] > int_input3[count + 1])
	    {
	      val = 1;
	      break;
	    }
	}
      if (val != 0)
	{
	  sciprint ("Inputs are not coef and length array!\n");
	  return 0;
	}
      wrcoef_content_validate (pvApiCtx, &errCode, flow, input_string1,    NULL, NULL, NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if (int_input3[0] < m4*n4)
	{
	  sciprint ("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      m6 = 1;
      n6 = int_input3[m3*n3-1];
    //  CreateVar(6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m6 , n6 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      wrcoef (input2, m2*n2, input4, input5, m4*n4,
	      int_input3, m3*n3, output1, m6*n6, input_string1,
	      m3*n3-2, m3*n3-2, getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 6;
      break;
    }
  case 4:
    {
      //GetRhsVar(1, "c", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 1 , &input_string1 );
      m1=1;n1=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
        //GetRhsVar(2, "d", &m2, &n2, &l2);
        readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
        if(readFlag==SWT_GWSUPPORT_ERROR)
          {
            return 0;
          }
          //GetRhsVar(3, "i", &m3, &n3, &l3);
          readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 3,  &m3 , &n3 , &int_input3 );
          if(readFlag==SWT_GWSUPPORT_ERROR)
            {
              return 0;
            }
            //  GetRhsVar(4, "d", &m4, &n4, &l4);
            readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 4,  &m4 , &n4 , &input4 );
            if(readFlag==SWT_GWSUPPORT_ERROR)
              {
                return 0;
              }
              //  GetRhsVar(5, "d", &m5, &n5, &l5);
              readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 5,  &m5 , &n5 , &input5 );
              if(readFlag==SWT_GWSUPPORT_ERROR)
                {
                  return 0;
                }
      //GetRhsVar(6, "i", &m6, &n6, &l6);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 6,  &m6 , &n6 , &int_input6 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      len = 0;
      for (count = 0; count < (m3 * n3 - 1); count++)
	len += int_input3[count];
      if (len != m2 * n2)
	{
	  sciprint ("Inputs are not coef and length array!\n");
	  return 0;
	}
      val = 0;
      for (count = 0; count < (m3 * n3 - 1); count++)
	{
	  if (int_input3[count] > int_input3[count + 1])
	    {
	      val = 1;
	      break;
	    }
	}
      if (val != 0)
	{
	  sciprint ("Inputs are not coef and length array!\n");
	  return 0;
	}
      wrcoef_content_validate (pvApiCtx, &errCode, flow, input_string1,     NULL, NULL, int_input6);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if (int_input6[0] > (m3*n3-2))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      if (int_input3[0] < m4*n4)
	{
	  sciprint ("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      m7 = 1;
      n7 = int_input3[m3*n3-1];
      //CreateVar(7, "d", &m7, &n7, &l7);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m7 , n7 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      wrcoef (input2, m2*n2, input4, input5, m4*n4,
      int_input3, m3*n3, output1, m7*n7, input_string1,
	      m3*n3-2, int_input6[0], getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 7;
      break;
    }
  default:
    break;
  }

  return 0;
}

int
int_appcoef 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int m1, n1, m2, n2, m3, n3;
  static int m4, n4, m5, n5, m6, n6;
  static int minrhs=3, maxrhs=5, minlhs=1, maxlhs=1;
  int errCode, flow, len, count, val, family, member, ii;
  Func syn_fun;
  swt_wavelet pWaveStruct;
  int readFlag;
  double *input1 = NULL;
  int *int_input2 = NULL;
  double *input3 = NULL;
  double *input4 = NULL;
  int *int_input4 = NULL;
  int *int_input5 = NULL;
  int *int_input6 = NULL;
  char * input_string3 = NULL;
  char * input_string4 = NULL;
  double *output1;

  CheckInputArgument(pvApiCtx,minrhs,maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs,maxlhs);

  appcoef_form_validate (pvApiCtx, &errCode, &flow, Rhs);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }


  switch (flow){
  case 1:
    {
      //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 2,  &m2, &n2 , &int_input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "c", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 3 , &input_string3 );
      m3=1;n3=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      len = 0;
      for (count = 0; count < (m2 * n2 - 1); count++)
	len += int_input2[count];
      if (len != m1 * n1)
	{
	  sciprint ("Inputs are not coef and length array!\n");
	  return 0;
	}
      val = 0;
      for (count = 0; count < (m2 * n2 - 1); count++)
	{
	  if (int_input2[count] > int_input2[count + 1])
	    {
	      val = 1;
	      break;
	    }
	}
      if (val != 0)
	{
	  sciprint ("Inputs are not coef and length array!\n");
	  return 0;
	}
      appcoef_content_validate (pvApiCtx, &errCode, flow, input_string3);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wavelet_parser(input_string3,&family,&member);
      wavelet_fun_parser (input_string3, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      if (int_input2[0] < pWaveStruct.length)
	{
	  sciprint ("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      m4 = 1;
      n4 = int_input2[0];
      //CreateVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      appcoef (input1, m1*n1, output1, m4*n4,
	       pWaveStruct.pLowPass, pWaveStruct.pHiPass,
	       pWaveStruct.length, int_input2, m2*n2,
	       m2*n2-2, m2*n2-2, getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 4;
      filter_clear();
      break;
    }
  case 2:
    {
            //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 2,  &m2, &n2 , &int_input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "c", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 3 , &input_string3 );
      m3=1;n3=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "i", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 4,  &m4, &n4 , &int_input4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      len = 0;
      for (count = 0; count < (m2 * n2 - 1); count++)
	len += int_input2[count];
      if (len != m1 * n1)
	{
	  sciprint ("Inputs are not coef and length array!\n");
	  return 0;
	}
      val = 0;
      for (count = 0; count < (m2 * n2 - 1); count++)
	{
	  if (int_input2[count] > int_input2[count + 1])
	    {
	      val = 1;
	      break;
	    }
	}
      if (val != 0)
	{
	  sciprint ("Inputs are not coef and length array!\n");
	  return 0;
	}
      appcoef_content_validate (pvApiCtx, &errCode, flow, input_string3);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if ((int_input4[0]>(m2*n2-2)) || (int_input4[0]<0))
	{
	  sciprint ("Level Parameter is not valid for input vector!\n");
	  return 0;
	}
      wavelet_parser(input_string3,&family,&member);
      wavelet_fun_parser (input_string3, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      if (int_input2[0] < pWaveStruct.length)
	{
	  sciprint ("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      m5 = 1;
      n5 = int_input2[n2 * m2 - 2 - int_input4[0] + 1];
      //CreateVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      appcoef (input1, m1*n1, output1, m5*n5,
	       pWaveStruct.pLowPass, pWaveStruct.pHiPass,
	       pWaveStruct.length, int_input2, m2*n2,
	       m2*n2-2, int_input4[0], getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 5;
      filter_clear();
      break;
    }
  case 3:
    {
            //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 2,  &m2, &n2 , &int_input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 3,  &m3, &n3 , &input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 4,  &m4, &n4 , &input4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      len = 0;
      for (count = 0; count < (m2 * n2 - 1); count++)
	len += int_input2[count];
      if (len != m1 * n1)
	{
	  sciprint ("Inputs are not coef and length array!\n");
	  return 0;
	}
      val = 0;
      for (count = 0; count < (m2 * n2 - 1); count++)
	{
	  if (int_input2[count] > int_input2[count + 1])
	    {
	      val = 1;
	      break;
	    }
	}
      if (val != 0)
	{
	  sciprint ("Inputs are not coef and length array!\n");
	  return 0;
	}
      appcoef_content_validate (pvApiCtx, &errCode, flow, NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if (int_input2[0] < m3*n3)
	{
	  sciprint ("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      m5 = 1;
      n5 = int_input2[0];
      //CreateVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      appcoef (input1, m1*n1, output1, m5*n5, input3, input4,
	       m3*n3, int_input2, m2*n2, m2*n2-2, m2*n2-2, getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 5;
      break;
    }
  case 4:
    {
            //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 2,  &m2, &n2 , &int_input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 3,  &m3, &n3 , &input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 4,  &m4, &n4 , &input4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(5, "i", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 5,  &m5, &n5 , &int_input5 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      len = 0;
      for (count = 0; count < (m2 * n2 - 1); count++)
	len += int_input2[count];
      if (len != m1 * n1)
	{
	  sciprint ("Inputs are not coef and length array!\n");
	  return 0;
	}
      val = 0;
      for (count = 0; count < (m2 * n2 - 1); count++)
	{
	  if (int_input2[count] > int_input2[count + 1])
	    {
	      val = 1;
	      break;
	    }
	}
      if (val != 0)
	{
	  sciprint ("Inputs are not coef and length array!\n");
	  return 0;
	}
      appcoef_content_validate (pvApiCtx, &errCode, flow, NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if ((int_input5[0]>(m2*n2-2)) || (int_input5[0]<0))
	{
	  sciprint ("Level Parameter is not valid for input vector!\n");
	  return 0;
	}
      if (int_input2[0] < m3*n3)
	{
	  sciprint ("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      m6 = 1;
      n6 = int_input2[n2 * m2 - 2 - int_input5[0] + 1];
      //CreateVar(6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m6 , n6 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      appcoef (input1, m1*n1, output1, m6*n6, input3, input4,
	       m3*n3, int_input2, m2*n2, m2*n2-2, int_input5[0], getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 6;
      break;
    }
  default:
    break;
  }

  return 0;
}

int
int_detcoef 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int m1, n1, m2, n2, m3, n3, m4, n4;
  static int minrhs=2, maxrhs=3, minlhs=1, maxlhs=1;
  int errCode, flow, len, val, count;
  int readFlag;
  double *input1;
  int *input2;
  int *input3;
  double *output1;

  CheckInputArgument(pvApiCtx,minrhs,maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs,maxlhs);

  detcoef_form_validate (pvApiCtx, &errCode, &flow, Rhs);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  switch (flow) {
  case 1:
    {
      //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      len = 0;
      for (count = 0; count < (m2 * n2 - 1); count++)
	len += input2[count];
      if (len != m1 * n1)
	{
	  sciprint ("Inputs are not coef and length array!\n");
	  return 0;
	}
      val = 0;
      for (count = 0; count < (m2 * n2 - 1); count++)
	{
	  if (input2[count] > input2[count + 1])
	    {
	      val = 1;
	      break;
	    }
	}
      if (val != 0)
	{
	  sciprint ("Inputs are not coef and length array!\n");
	  return 0;
	}
      m3 = 1;
      n3 = input2[1];
      //CreateVar(3, "d", &m3, &n3, &l3);
        readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
        if(readFlag==SWT_GWSUPPORT_ERROR)
          {
            return 0;
          }
      detcoef(input1, m1*n1, input2, m2*n2, output1, m3*n3,
	      m2*n2-2, m2*n2-2);
      //AssignOutputVariable(pvApiCtx,1) = 3;
      break;
    }
  case 2:
    {
      //      //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
    //sciprint ("First input m1 %d n1 %d \n",m1,n1);
      //GetRhsVar(2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
              //sciprint ("second input m1 %d n1 %d \n",m2,n2);
      //GetRhsVar(3, "i", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 3,  &m3, &n3 , &input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
              //sciprint ("third input m1 %d n1 %d \n",m3,n3);
      len = 0;
      for (count = 0; count < (m2 * n2 - 1); count++)
	len += input2[count];
      if (len != m1 * n1)
	{
	  sciprint ("Inputs are not coef and length array!\n");
	  return 0;
	}
      val = 0;
      for (count = 0; count < (m2 * n2 - 1); count++)
	{
	  if (input2[count] > input2[count + 1])
	    {
	      val = 1;
	      break;
	    }
	}
      if (val != 0)
	{
	  sciprint ("Inputs are not coef and length array!\n");
	  return 0;
	}
      if ((input3[0]>(m2*n2-2)) || (input3[0]<1))
	{
		sciprint ("Level Parameter is not valid for input vector!\n");
	  return 0;
	}
      m4 = 1;
      n4 = input2[n2 * m2 - input3[0] - 1];
      //CreateVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
	  //sciprint ("ok1\n");
      detcoef(input1, m1*n1, input2, m2*n2, output1, m4*n4,
	      m2*n2-2, input3[0]);
	  //sciprint ("ok2\n");
      //AssignOutputVariable(pvApiCtx,1) = 4;
      break;
    }
  default:
    break;
  }

  return 0;
}

int
int_wenergy 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int m1, n1, m2, n2, m3, n3, m4, n4;
  static int minrhs=2, maxrhs=2, minlhs=2, maxlhs=2;
  int errCode, len, val, count;
  int readFlag;
  double *input1;
  int *int_input2;
  double *output1;
  double *output2;

  CheckInputArgument(pvApiCtx,minrhs,maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs,maxlhs);

  wenergy_form_validate (pvApiCtx, &errCode, Rhs);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

        //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
  //GetRhsVar(2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 2,  &m2, &n2 , &int_input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }

  len = 0;
  for (count = 0; count < (m2 * n2 - 1); count++)
    len += int_input2[count];
  if (len != m1 * n1)
    {
      sciprint ("Inputs are not coef and length array!\n");
      return 0;
    }
  val = 0;
  for (count = 0; count < (m2 * n2 - 1); count++)
    {
      if (int_input2[count] > int_input2[count + 1])
	{
	  val = 1;
	  break;
	}
    }
  if (val != 0)
    {
      sciprint ("Inputs are not coef and length array!\n");
      return 0;
    }

  m3 = 1;
  n3 = 1;
  m4 = 1;
  n4 = m2 * n2 - 2;
  //CreateVar(3, "d", &m3, &n3, &l3);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m3 , n3 , &output1 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  //CreateVar(4, "d", &m4, &n4, &l4);
  readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 2,  m4 , n4 , &output2 );
  if(readFlag==SWT_GWSUPPORT_ERROR)
    {
      return 0;
    }
  wenergy(input1, m1 * n1, int_input2, m2 * n2,
  output1, m3 * n3, output2, m4 * n4);
  //AssignOutputVariable(pvApiCtx,1) = 3;
  //AssignOutputVariable(pvApiCtx,2) = 4;
  return 0;
}

int
int_upcoef 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int  m1, n1,  m2, n2,  m3, n3;
  static int  m4, n4,  m5, n5,  m6, n6;
  static int m7, n7;
  static int minrhs=3, maxrhs=6, minlhs=1, maxlhs=1;
  int errCode, flow, family, member, ii;
  int s1, s2;
  Func syn_fun;
  swt_wavelet pWaveStruct;
  int readFlag;
  double *input2;
  double *input3;
  double *input4;
  double *input5;
  double *output1;
  int *int_input2;
  int *int_input4;
  int *int_input5;
  int *int_input6;
  char *input_string1=NULL;
  char *input_string3=NULL;

  CheckInputArgument(pvApiCtx,minrhs,maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs,maxlhs);

  upcoef_form_validate (pvApiCtx, &errCode, &flow, Rhs);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }



  switch (flow) {
  case 1:
    {
      //GetRhsVar(1, "c", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 1 , &input_string1 );
      m1=1;n1=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
            //GetRhsVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "c", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 3 , &input_string3 );
      m3=1;n3=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "i", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 4,  &m4, &n4 , &int_input4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      upcoef_content_validate (pvApiCtx, &errCode, flow, input_string1,    input_string3, int_input4, NULL,NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wavelet_parser(input_string3,&family,&member);
      wavelet_fun_parser (input_string3, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
     // if (pWaveStruct.length>m2*n2)
	//{
	  //sciprint ("Input signal is not valid for selected decompostion level and wavelets!\n");
	  //return 0;
	//}
      upcoef_len_cal (m2*n2, pWaveStruct.length, int_input4[0],
		      &s1, &s2);
      m5 = 1;
      n5 = s1;
      //CreateVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      upcoef (input2, m2*n2, pWaveStruct.pLowPass,
	      pWaveStruct.pHiPass, pWaveStruct.length, output1,
	      m5*n5, s1, input_string1, int_input4[0]);
      //AssignOutputVariable(pvApiCtx,1) = 5;
      break;
    }
  case 2:
    {
      //GetRhsVar(1, "c", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 1 , &input_string1 );
      m1=1;n1=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
            //GetRhsVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "c", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 3 , &input_string3 );
      m3=1;n3=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "i", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 4,  &m4, &n4 , &int_input4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(5, "i", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 5,  &m5, &n5 , &int_input5 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      upcoef_content_validate (pvApiCtx, &errCode, flow, input_string1,    input_string3, int_input4, int_input5, NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wavelet_parser(input_string3,&family,&member);
      wavelet_fun_parser (input_string3, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
     // if (pWaveStruct.length>m2*n2)
	//{
	 // sciprint ("Input signal is not valid for selected decompostion level and wavelets!\n");
	 // return 0;
	//}
      upcoef_len_cal (m2*n2, pWaveStruct.length, int_input4[0],
		      &s1, &s2);
      if (int_input5[0]>s1)
	{
	  sciprint("Length Parameter is not valid for input vector!\n");
	  return 0;
	}
      m6 = 1;
      n6 = int_input5[0];
      //CreateVar(6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m6 , n6 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      upcoef (input2, m2*n2, pWaveStruct.pLowPass,
	      pWaveStruct.pHiPass, pWaveStruct.length, output1,
	      m6*n6, s1, input_string1, int_input4[0]);
      //AssignOutputVariable(pvApiCtx,1) = 6;
      filter_clear();
      break;
    }
  case 3:
    {
      //GetRhsVar(1, "c", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 1 , &input_string1 );
      m1=1;n1=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 3,  &m3, &n3 , &input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 4,  &m4, &n4 , &input4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(5, "i", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 5,  &m5, &n5 , &int_input5 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      upcoef_content_validate (pvApiCtx, &errCode, flow, input_string1,  NULL, NULL, int_input5, NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      //if (m3*n3>m2*n2)
	//{
	  //sciprint ("Input signal is not valid for selected decompostion level and wavelets!\n");
	  //return 0;
	//}
      upcoef_len_cal (m2*n2, m3*n3, int_input5[0], &s1, &s2);
      m6 = 1;
      n6 = s1;
      //CreateVar(6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m6 , n6 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      upcoef (input2, m2*n2, input3, input4, m3*n3, output1,
	      m6*n6, s1, input_string1, int_input5[0]);
      //AssignOutputVariable(pvApiCtx,1) = 6;
      break;
    }
  case 4:
    {
      //GetRhsVar(1, "c", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 1 , &input_string1 );
      m1=1;n1=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
            //GetRhsVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 3,  &m3, &n3 , &input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 4,  &m4, &n4 , &input4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(5, "i", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 5,  &m5, &n5 , &int_input5 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(6, "i", &m6, &n6, &l6);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 6,  &m6, &n6 , &int_input6 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      upcoef_content_validate (pvApiCtx, &errCode, flow, input_string1,  NULL, NULL, int_input5, int_input6);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
     // if (m3*n3>m2*n2)
	//{
	  //sciprint ("Input signal is not valid for selected decompostion level and wavelets!\n");
	  //return 0;
	//}
      upcoef_len_cal (m2*n2, m3*n3, int_input5[0], &s1, &s2);
      if (int_input6[0]>s1)
	{
	  sciprint("Length Parameter is not valid for input vector!\n");
	  return 0;
	}
      m7 = 1;
      n7 = int_input6[0];
      //CreateVar(7, "d", &m7, &n7, &l7);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m7 , n7 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      upcoef (input2, m2*n2, input3, input4, m3*n3, output1,
	      m7*n7, s1, input_string1, int_input5[0]);
      //AssignOutputVariable(pvApiCtx,1) = 7;
      break;
    }
  case 5:
    {
      //GetRhsVar(1, "c", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 1 , &input_string1 );
      m1=1;n1=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
            //GetRhsVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "c", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 3 , &input_string3 );
      m3=1;n3=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      upcoef_content_validate (pvApiCtx, &errCode, flow, input_string1,   input_string3, NULL, NULL, NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wavelet_parser(input_string3,&family,&member);
      wavelet_fun_parser (input_string3, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      //if (pWaveStruct.length>m2*n2)
	//{
	 // sciprint ("Input signal is not valid for selected decompostion level and wavelets!\n");
	 // return 0;
	//}
      upcoef_len_cal (m2*n2, pWaveStruct.length, 1, &s1, &s2);
      m4 = 1;
      n4 = s1;
      //CreateVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      upcoef (input2, m2*n2, pWaveStruct.pLowPass,
	      pWaveStruct.pHiPass, pWaveStruct.length, output1,
	      m4*n4, s1, input_string1, 1);
      //AssignOutputVariable(pvApiCtx,1) = 4;
      filter_clear();
      break;
    }
  case 6:
    {
      //GetRhsVar(1, "c", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 1 , &input_string1 );
      m1=1;n1=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
            //GetRhsVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 3,  &m3, &n3 , &input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 4,  &m4, &n4 , &input4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      upcoef_content_validate (pvApiCtx, &errCode, flow, input_string1, NULL,NULL,NULL,NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
     // if (m3*n3>m2*n2)
	//{
	 // sciprint ("Input signal is not valid for selected decompostion level and wavelets!\n");
	  //return 0;
	//}
      upcoef_len_cal (m2*n2, m3*n3, 1, &s1, &s2);
      m5 = 1;
      n5 = s1;
      //CreateVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      upcoef (input2, m2*n2, input3, input4, m3*n3,
	      output1, m5*n5, s1,  input_string1, 1);
      //AssignOutputVariable(pvApiCtx,1) = 5;
      break;
    }
  default:
    break;
  }
  return 0;
}

int
int_upwlev 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int m1, n1, m2, n2, m3, n3;
  static int m4, n4, m5, n5, m6, n6;
  static int m7, n7;
  static int minrhs=3, maxrhs=4, minlhs=3, maxlhs=3;
  int errCode, flow, len, count, val, family, member, ii;
  Func syn_fun;
  swt_wavelet pWaveStruct;
  int readFlag;
  double *input1;
  int *int_input2;
  char *input_string3=NULL;
  double *input3;
  double *input4;
  double *output1;
  int *int_output2;
  double *output3;

  CheckInputArgument(pvApiCtx,minrhs,maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs,maxlhs);

  upwlev_form_validate (pvApiCtx, &errCode, &flow, Rhs);
  if (errCode != SUCCESS)
    {
      validate_print (errCode);
      return 0;
    }

  switch (flow) {
  case 1:
    {
            //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 2,  &m2, &n2 , &int_input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "c", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 3 , &input_string3 );
      m3=1;n3=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      upwlev_content_validate (pvApiCtx, &errCode, flow, input_string3);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if (m2*n2 <= 3)
	{
	  sciprint("Inputs are not coef and length array!\n");
	  return 0;
	}
      len = 0;
      for (count = 0; count < (m2 * n2 - 1); count++)
	len += int_input2[count];
      if (len != m1 * n1)
	{
	  sciprint ("Inputs are not coef and length array!\n");
	  return 0;
	}
      val = 0;
      for (count = 0; count < (m2 * n2 - 1); count++)
	{
	  if (int_input2[count] > int_input2[count + 1])
	    {
	      val = 1;
	      break;
	    }
	}
      if (val != 0)
	{
	  sciprint ("Inputs are not coef and length array!\n");
	  return 0;
	}
      wavelet_parser(input_string3,&family,&member);
      wavelet_fun_parser (input_string3, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      if (int_input2[0] < pWaveStruct.length)
	{
	  sciprint ("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
	  if (m2*n2<4)
	  {
         sciprint("Decomposition level less than 2 is not accepted!\n");
         return 0;
	  }
      m4 = 1;
      m5 = 1;
      m6 = 1;
      n4 = m1*n1 - 2*int_input2[0] + int_input2[2];
      n5 = m2 * n2 - 1;
      n6 = int_input2[0];
      //CreateVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m4 , n4 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(5, "i", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoublesAsInteger (pvApiCtx, fname, 2,  m5 , n5 , &int_output2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 3,  m6 , n6 , &output3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //printf("before upwlev!\n");
      upwlev (input1, m1*n1, int_input2, m2*n2, pWaveStruct.pLowPass,
	      pWaveStruct.pHiPass, pWaveStruct.length,
        output1, m4*n4, int_output2, m5*n5, output3, m6*n6,
	      m2*n2-2, getdwtMode());
      //printf("after upwlev!\n");
      //AssignOutputVariable(pvApiCtx,1) = 4;
      //AssignOutputVariable(pvApiCtx,2) = 5;
      //AssignOutputVariable(pvApiCtx,3) = 6;
      filter_clear();
      break;
    }
  case 2:
    {
            //GetRhsVar(1, "d", &m1, &n1, &l1);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 1,  &m1, &n1 , &input1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(2, "i", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 2,  &m2, &n2 , &int_input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 3,  &m3, &n3 , &input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 4,  &m4, &n4 , &input4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      upwlev_content_validate (pvApiCtx, &errCode, flow, NULL);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if (m2*n2 <= 3)
	{
	  sciprint("Inputs are not coef and length array!\n");
	  return 0;
	}
      len = 0;
      for (count = 0; count < (m2 * n2 - 1); count++)
	len += int_input2[count];
      if (len != m1 * n1)
	{
	  sciprint ("Inputs are not coef and length array!\n");
	  return 0;
	}
      val = 0;
      for (count = 0; count < (m2 * n2 - 1); count++)
	{
	  if (int_input2[count] > int_input2[count + 1])
	    {
	      val = 1;
	      break;
	    }
	}
      if (val != 0)
	{
	  sciprint ("Inputs are not coef and length array!\n");
	  return 0;
	}
      if (int_input2[0]<m3*n3)
	{
	  sciprint ("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
	  if (m2*n2<4)
	  {
         sciprint("Decomposition level less than 2 is not accepted!\n");
         return 0;
	  }
      m5 = 1;
      m6 = 1;
      m7 = 1;
      n5 = m1*n1 - 2*int_input2[0] + int_input2[2];
      n6 = m2 * n2 - 1;
      n7 = int_input2[0];
      //CreateVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 1,  m5 , n5 , &output1 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
    //CreateVar(6, "i", &m6, &n6, &l6);
      readFlag = swt_gwsupport_AllocMatrixOfDoublesAsInteger (pvApiCtx, fname, 2,  m6 , n6 , &int_output2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //CreateVar(7, "d", &m7, &n7, &l7);
      readFlag = swt_gwsupport_AllocMatrixOfDoubles (pvApiCtx, fname, 3,  m7 , n7 , &output3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      upwlev (input1, m1*n1, int_input2, m2*n2, input3,
	      input4, m3*n3,
        output1, m5*n5, int_output2, m6*n6, output3, m7*n7,
	      m2*n2-2, getdwtMode());
      //AssignOutputVariable(pvApiCtx,1) = 5;
      //AssignOutputVariable(pvApiCtx,2) = 6;
      //AssignOutputVariable(pvApiCtx,3) = 7;
      break;
    }
  default:
    break;
  }
  return 0;
}
