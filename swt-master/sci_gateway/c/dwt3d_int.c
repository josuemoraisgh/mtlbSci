/*
 * -------------------------------------------------------------------------
 * dwt3d_int.c -- 3-D signal decomposition and reconstruction interface
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

#include "swt_common.h"
// #include <stack-c.h>

int
int_dwt3 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int l1, m1, n1, l2, m2, n2, l3, m3, n3, l4, m4, n4;
  static int l5, m5, n5, l6, m6, n6, l7, m7, n7, l8, m8, n8;
  static int l9, m9, n9, l10, m10, n10, mL1, nL1, mL2, nL2;
  static int mL3, nL3, it3, lcL3, lL3, lL2;
  static int minrhs=2, maxrhs=9, minlhs=1, maxlhs=1;
  char **Str2;
  static char *Str[]= { "hm","dims","entries"};
  int errCode, flow, family, member, ii;
  Func ana_fun;
  swt_wavelet pWaveStruct;
  extend_method extMethod;
  int mL=3, nL=1, ms=1, ns=3, mi=1, ni=4;
  int r, c, s, zero, inc, mn, row, col, sli, r2;
  int val1, val2, val3, stride1, stride2, stride3;
  int si[4];
  double *temp, *var3, *var4, *tm1;
  double *Lo1, *Hi1, *Lo2, *Hi2, *Lo3, *Hi3;
  int fLen1, fLen2, fLen3;
  int readFlag;
  int * dims1;
  int ndims1;
  double *input1=NULL;
  double *input2=NULL;
  double *input3=NULL;
  double *input4=NULL;
  double *input5=NULL;
  double *input6=NULL;
  double *input7=NULL;
  double *input8=NULL;
  int *int_input1=NULL;
  int *int_input2=NULL;
  int *int_input3=NULL;
  int *int_input4=NULL;
  int *int_input5=NULL;
  int *int_input6=NULL;
  int *int_input7=NULL;
  int *int_input8=NULL;
  char *input_string1=NULL;
  char *input_string2=NULL;
  char *input_string3=NULL;
  char *input_string4=NULL;
  char *input_string5=NULL;
  char *input_string6=NULL;
  char *input_string7=NULL;
  char *input_string8=NULL;
  char *input_string9=NULL;
  //SciIntMat ssi, M;

  CheckInputArgument(pvApiCtx,minrhs,maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs,maxlhs);

  dwt3_form_validate (pvApiCtx, &errCode,&flow, Rhs);
  if (errCode != SUCCESS)
  {
    validate_print (errCode);
    return 0;
  }



  // GetRhsVar(1,"m",&m1,&n1,&l1);
  // CheckLength(1,m1,3);
  // GetListRhsVar(1,1,"S",&mL1,&nL1,&Str2);
  // if ( strcmp(Str2[0],"hm") != 0)
  //   {
  //     Scierror(999,"Argument %d is not an hypermatrix\r\n",1);
  //     return 0;
  //   }
  // FreeRhsSVar(Str2);
  // GetListRhsVar(1,2,"I",&mL2,&nL2,&M);
  // GetListRhsCVar(1,3,"d",&it3,&mL3,&nL3,&lL3,&lcL3);
  //
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

  if (flow==3)
   {

     //GetRhsVar(2, "c", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 2 , &input_string2 );
      m2=1;n2=1;
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
     if(strcmp(input_string3,"mode"))
       flow = 5;
   }
  else
  {
    l1 = 0;
    l2 = 0;
    l3 = 0;
  }



  si[0] = 0;
  si[1] = 0;
  si[2] = 0;
  si[3] = 0;

  mn = mL2*nL2;
  inc  = 1;
  zero = 0;

  // temp = malloc(m1*n1*sizeof(double));
  // C2F(tpconv)(&M.it,&zero,&mn, M.D, &inc, temp, &inc);
  // row = (int)temp[0];
  // col = (int)temp[1];
  // sli = (int)temp[2];
  // free(temp);
  row = dims1[0];
  col = dims1[1];
  sli = dims1[2];

  switch (flow) {
  case 1:
    {
      //printf("flow 1\n");
      //GetRhsVar(2, "c", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 2 , &input_string2 );
      m2=1;n2=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      dwt3_content_validate (pvApiCtx, &errCode,flow,input_string2,input_string3,input_string4,input_string5,input_string6,input_string8,input_string9);

      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      wavelet_parser(input_string2,&family,&member);
      wavelet_fun_parser (input_string2, &ii);
      ana_fun = wi[ii].analysis;
      (*ana_fun)(member, &pWaveStruct);

      wave_len_validate ( row, pWaveStruct.length, &stride1, &val1);
      wave_len_validate ( col, pWaveStruct.length, &stride2, &val2);
      wave_len_validate ( sli, pWaveStruct.length, &stride3, &val3);
      if ((val1 == 0) || (val2 == 0) || (val3 == 0))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}


      r = (int)floor((row + pWaveStruct.length - 1)/2);
      c = (int)floor((col + pWaveStruct.length - 1)/2);
      s = (int)floor((sli + pWaveStruct.length - 1)/2);

      m3 = r*c*s*8;
      n3 = 1;
      si[0] = r;
      si[1] = c;
      si[2] = s;
      si[3] = 8;
      // ssi.m = 1;
      // ssi.n = 4;
      // ssi.it = 4;
      // ssi.l = 100;
      // ssi.D = si;
      var3 = malloc(m3*n3*sizeof(double));

      dwt3(input1, row, col, sli, var3, row, col, sli,
	   r, c, s, pWaveStruct.pLowPass, pWaveStruct.pHiPass,
	   pWaveStruct.pLowPass, pWaveStruct.pHiPass,
	   pWaveStruct.pLowPass, pWaveStruct.pHiPass,
	   pWaveStruct.length, pWaveStruct.length,
	   pWaveStruct.length, getdwtMode());

      //CreateVar(3, "m", &mL, &nL, &l3);
      //CreateListVarFromPtr(3,1,"S",&ms,&ns,Str);
      //CreateListVarFromPtr(3,2,"I",&mi,&ni,&ssi);
      //CreateListVarFromPtr(3,3,"d",&m3, &n3, &var3);
      readFlag = swt_gwsupport_CreateHypermatOfDouble (pvApiCtx, fname, 1,  si , 4 , var3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      free(var3);
      //AssignOutputVariable(pvApiCtx,1) = 3;
      break;
    }
  case 2:
    {
      //sciprint("flow 2\n");
      //GetRhsVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname,3,  &m3, &n3 , &input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      dwt3_content_validate (pvApiCtx, &errCode,flow,input_string2,input_string3,input_string4,input_string5,input_string6,input_string8,input_string9);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}

      if ((row<m2*n2) || (col<m2*n2) || (sli<m2*n2))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}

      r = (int)floor((row + m2 * n2 - 1)/2);
      c = (int)floor((col + m2 * n2 - 1)/2);
      s = (int)floor((sli + m2 * n2 - 1)/2);

      si[0] = r;
      si[1] = c;
      si[2] = s;
      si[3] = 8;
      // ssi.m = 1;
      // ssi.n = 4;
      // ssi.it = 4;
      // ssi.l = 100;
      // ssi.D = si;
      m4 = r*c*s*8;
      n4 = 1;
      var4 = malloc(m4*n4*sizeof(double));

      dwt3(input1, row, col, sli, var4, row, col, sli,
	   r, c, s, input2, input3, input2, input3,
	   input2, input3, m2*n2, m2*n2, m2*n2, getdwtMode());

      //CreateVar(4, "m", &mL, &nL, &l4);
      //CreateListVarFromPtr(4,1,"S",&ms,&ns,Str);
      //CreateListVarFromPtr(4,2,"I",&mi,&ni,&ssi);
      //CreateListVarFromPtr(4,3,"d",&m4, &n4, &var4);
      readFlag = swt_gwsupport_CreateHypermatOfDouble (pvApiCtx, fname, 1,  si , 4 , var4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      free(var4);
      //AssignOutputVariable(pvApiCtx,1) = 4;
      break;
    }
  case 3:
    {
      //sciprint("flow 3\n");
      //GetRhsVar(4, "c", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 4 , &input_string4 );
      m4=1;n4=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      dwt3_content_validate (pvApiCtx, &errCode,flow,input_string2,input_string3,input_string4,input_string5,input_string6,input_string8,input_string9);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}

      extend_method_parse (input_string4, &extMethod);
      wavelet_parser(input_string2,&family,&member);
      wavelet_fun_parser (input_string2, &ii);
      ana_fun = wi[ii].analysis;
      (*ana_fun)(member, &pWaveStruct);

      wave_len_validate ( row, pWaveStruct.length, &stride1, &val1);
      wave_len_validate ( col, pWaveStruct.length, &stride2, &val2);
      wave_len_validate ( sli, pWaveStruct.length, &stride3, &val3);
      if ((val1 == 0) || (val2 == 0) || (val3 == 0))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}

      r = (int)floor((row + pWaveStruct.length - 1)/2);
      c = (int)floor((col + pWaveStruct.length - 1)/2);
      s = (int)floor((sli + pWaveStruct.length - 1)/2);

      si[0] = r;
      si[1] = c;
      si[2] = s;
      si[3] = 8;
      // ssi.m = 1;
      // ssi.n = 4;
      // ssi.it = 4;
      // ssi.l = 100;
      // ssi.D = si;
      m5 = r*c*s*8;
      n5 = 1;
      var3 = malloc(m5*n5*sizeof(double));

      dwt3(input1, row, col, sli, var3, row, col, sli,
	   r, c, s, pWaveStruct.pLowPass, pWaveStruct.pHiPass,
	   pWaveStruct.pLowPass, pWaveStruct.pHiPass,
	   pWaveStruct.pLowPass, pWaveStruct.pHiPass,
	   pWaveStruct.length, pWaveStruct.length,
	   pWaveStruct.length, extMethod);

      //CreateVar(5, "m", &mL, &nL, &l5);
      //CreateListVarFromPtr(5,1,"S",&ms,&ns,Str);
      //CreateListVarFromPtr(5,2,"I",&mi,&ni,&ssi);
      //CreateListVarFromPtr(5,3,"d",&m5, &n5, &var3);
      readFlag = swt_gwsupport_CreateHypermatOfDouble (pvApiCtx, fname, 1,  si , 4 , var3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      free(var3);
      //AssignOutputVariable(pvApiCtx,1) = 5;

      break;
    }
  case 4:
    {
      //sciprint("flow 4\n");
      //GetRhsVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname,3,  &m3, &n3 , &input3 );
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
      dwt3_content_validate (pvApiCtx, &errCode,flow,input_string2,input_string3,input_string4,input_string5,input_string6,input_string8,input_string9);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if ((row<m2*n2) || (col<m2*n2) || (sli<m2*n2))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}

      extend_method_parse (input_string5, &extMethod);

      r = (int)floor((row + m2 * n2 - 1)/2);
      c = (int)floor((col + m2 * n2 - 1)/2);
      s = (int)floor((sli + m2 * n2 - 1)/2);

      si[0] = r;
      si[1] = c;
      si[2] = s;
      si[3] = 8;
      // ssi.m = 1;
      // ssi.n = 4;
      // ssi.it = 4;
      // ssi.l = 100;
      // ssi.D = si;
      m6 = r*c*s*8;
      n6 = 1;
      var4 = malloc(m6*n6*sizeof(double));

      dwt3(input1, row, col, sli, var4, row, col, sli,
	   r, c, s, input2, input3, input2, input3,
	   input2, input3, m2*n2, m2*n2, m2*n2, extMethod);

      //CreateVar(6, "m", &mL, &nL, &l6);
      //CreateListVarFromPtr(6,1,"S",&ms,&ns,Str);
      //CreateListVarFromPtr(6,2,"I",&mi,&ni,&ssi);
      //CreateListVarFromPtr(6,3,"d",&m6, &n6, &var4);
      readFlag = swt_gwsupport_CreateHypermatOfDouble (pvApiCtx, fname, 1,  si , 4 , var4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      free(var4);
      //AssignOutputVariable(pvApiCtx,1) = 6;

      break;
    }
  case 5:
    {
      //sciprint("flow 5\n");
      //GetRhsVar(4, "c", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 4 , &input_string4 );
      m4=1;n4=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      dwt3_content_validate (pvApiCtx, &errCode,flow,input_string2,input_string3,input_string4,input_string5,input_string6,input_string8,input_string9);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}

      wavelet_parser(input_string2,&family,&member);
      wavelet_fun_parser (input_string2, &ii);
      ana_fun = wi[ii].analysis;
      (*ana_fun)(member, &pWaveStruct);
      wave_len_validate ( col, pWaveStruct.length, &stride1, &val1);
      if (val1 == 0)
	{
	  sciprint("Input signal (column length) is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      fLen1 = pWaveStruct.length;
      Lo1 =  malloc(fLen1*sizeof(double));
      Hi1 =  malloc(fLen1*sizeof(double));
      verbatim_copy(pWaveStruct.pLowPass, fLen1, Lo1, fLen1);
      verbatim_copy(pWaveStruct.pHiPass, fLen1, Hi1, fLen1);
      c = (int)floor((col + fLen1 - 1)/2);
      filter_clear();

      wavelet_parser(input_string3,&family,&member);
      wavelet_fun_parser (input_string3, &ii);
      ana_fun = wi[ii].analysis;
      (*ana_fun)(member, &pWaveStruct);
      wave_len_validate ( row, pWaveStruct.length, &stride1, &val1);
      if (val1 == 0)
	{
	  sciprint("Input signal (row length) is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      fLen2 = pWaveStruct.length;
      Lo2 =  malloc(fLen2*sizeof(double));
      Hi2 =  malloc(fLen2*sizeof(double));
      verbatim_copy(pWaveStruct.pLowPass, fLen2, Lo2, fLen2);
      verbatim_copy(pWaveStruct.pHiPass, fLen2, Hi2, fLen2);
      r = (int)floor((row + fLen2 - 1)/2);
      filter_clear();

      wavelet_parser(input_string4,&family,&member);
      wavelet_fun_parser (input_string4, &ii);
      ana_fun = wi[ii].analysis;
      (*ana_fun)(member, &pWaveStruct);
      wave_len_validate ( sli, pWaveStruct.length, &stride1, &val1);
      if (val1 == 0)
	{
	  sciprint("Input signal (slice length) is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      fLen3 = pWaveStruct.length;
      Lo3 =  malloc(fLen3*sizeof(double));
      Hi3 =  malloc(fLen3*sizeof(double));
      verbatim_copy(pWaveStruct.pLowPass, fLen3, Lo3, fLen3);
      verbatim_copy(pWaveStruct.pHiPass, fLen3, Hi3, fLen3);
      s = (int)floor((sli + fLen3 - 1)/2);
      filter_clear();

      si[0] = r;
      si[1] = c;
      si[2] = s;
      si[3] = 8;
      // ssi.m = 1;
      // ssi.n = 4;
      // ssi.it = 4;
      // ssi.l = 100;
      // ssi.D = si;
      m5 = r*c*s*8;
      n5 = 1;
      var3 = malloc(m5*n5*sizeof(double));

      dwt3(input1, row, col, sli, var3, row, col, sli,
	   r, c, s, Lo1, Hi1, Lo2, Hi2, Lo3, Hi3,
	   fLen1, fLen2, fLen3, getdwtMode());

      free(Lo1);
      free(Hi1);
      free(Lo2);
      free(Hi2);
      free(Lo3);
      free(Hi3);

      //CreateVar(5, "m", &mL, &nL, &l5);
      //CreateListVarFromPtr(5,1,"S",&ms,&ns,Str);
      //CreateListVarFromPtr(5,2,"I",&mi,&ni,&ssi);
      //CreateListVarFromPtr(5,3,"d",&m5, &n5, &var3);
      readFlag = swt_gwsupport_CreateHypermatOfDouble (pvApiCtx, fname, 1,  si , 4 , var3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      free(var3);
      //AssignOutputVariable(pvApiCtx,1) = 5;


      break;
    }
  case 6:
    {
      //sciprint("flow 6\n");
      //GetRhsVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname,3,  &m3, &n3 , &input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname,4,  &m4, &n4 , &input4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname,5,  &m5, &n5 , &input5 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname,6,  &m6, &n6 , &input6 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(7, "d", &m7, &n7, &l7);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname,7,  &m7, &n7 , &input7 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      dwt3_content_validate (pvApiCtx, &errCode,flow,input_string2,input_string3,input_string4,input_string5,input_string6,input_string8,input_string9);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if ((col<m2*n2) || (row<m4*n4) || (sli<m6*n6))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      c = (int)floor((col + m2 * n2 - 1)/2);
      r = (int)floor((row + m4 * n4 - 1)/2);
      s = (int)floor((sli + m6 * n6 - 1)/2);

      si[0] = r;
      si[1] = c;
      si[2] = s;
      si[3] = 8;
      // ssi.m = 1;
      // ssi.n = 4;
      // ssi.it = 4;
      // ssi.l = 100;
      // ssi.D = si;
      m8 = r*c*s*8;
      n8 = 1;
      var3 = malloc(m8*n8*sizeof(double));

      dwt3(input1, row, col, sli, var3, row, col, sli,
	   r, c, s, input2, input3, input4, input5,
	   input6, input7, m2*n2, m4*n4, m6*n6, getdwtMode());

      //CreateVar(8, "m", &mL, &nL, &l8);
      //CreateListVarFromPtr(8,1,"S",&ms,&ns,Str);
      //CreateListVarFromPtr(8,2,"I",&mi,&ni,&ssi);
      //CreateListVarFromPtr(8,3,"d",&m8, &n8, &var3);
      readFlag = swt_gwsupport_CreateHypermatOfDouble (pvApiCtx, fname, 1,  si , 4 , var3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      free(var3);
      //AssignOutputVariable(pvApiCtx,1) = 8;
      break;
    }
  case 7:
    {
      //sciprint("flow 7\n");
      //GetRhsVar(2, "c", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 2 , &input_string2 );
      m2=1;n2=1;
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
      //GetRhsVar(6, "c", &m6, &n6, &l6);
       readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 6 , &input_string6 );
      m6=1;n5=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      dwt3_content_validate (pvApiCtx, &errCode,flow,input_string2,input_string3,input_string4,input_string5,input_string6,input_string8,input_string9);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}

      extend_method_parse (input_string6, &extMethod);

      wavelet_parser(input_string2,&family,&member);
      wavelet_fun_parser (input_string2, &ii);
      ana_fun = wi[ii].analysis;
      (*ana_fun)(member, &pWaveStruct);
      wave_len_validate ( col, pWaveStruct.length, &stride1, &val1);
      if (val1 == 0)
	{
	  sciprint("Input signal (column length) is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      fLen1 = pWaveStruct.length;
      Lo1 =  malloc(fLen1*sizeof(double));
      Hi1 =  malloc(fLen1*sizeof(double));
      verbatim_copy(pWaveStruct.pLowPass, fLen1, Lo1, fLen1);
      verbatim_copy(pWaveStruct.pHiPass, fLen1, Hi1, fLen1);
      c = (int)floor((col + fLen1 - 1)/2);
      filter_clear();

      wavelet_parser(input_string3,&family,&member);
      wavelet_fun_parser (input_string3, &ii);
      ana_fun = wi[ii].analysis;
      (*ana_fun)(member, &pWaveStruct);
      wave_len_validate ( row, pWaveStruct.length, &stride1, &val1);
      if (val1 == 0)
	{
	  sciprint("Input signal (row length) is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      fLen2 = pWaveStruct.length;
      Lo2 =  malloc(fLen2*sizeof(double));
      Hi2 =  malloc(fLen2*sizeof(double));
      verbatim_copy(pWaveStruct.pLowPass, fLen2, Lo2, fLen2);
      verbatim_copy(pWaveStruct.pHiPass, fLen2, Hi2, fLen2);
      r = (int)floor((row + fLen2 - 1)/2);
      filter_clear();

      wavelet_parser(input_string4,&family,&member);
      wavelet_fun_parser (input_string4, &ii);
      ana_fun = wi[ii].analysis;
      (*ana_fun)(member, &pWaveStruct);
      wave_len_validate ( sli, pWaveStruct.length, &stride1, &val1);
      if (val1 == 0)
	{
	  sciprint("Input signal (slice length) is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      fLen3 = pWaveStruct.length;
      Lo3 =  malloc(fLen3*sizeof(double));
      Hi3 =  malloc(fLen3*sizeof(double));
      verbatim_copy(pWaveStruct.pLowPass, fLen3, Lo3, fLen3);
      verbatim_copy(pWaveStruct.pHiPass, fLen3, Hi3, fLen3);
      s = (int)floor((sli + fLen3 - 1)/2);
      filter_clear();

      si[0] = r;
      si[1] = c;
      si[2] = s;
      si[3] = 8;
      // ssi.m = 1;
      // ssi.n = 4;
      // ssi.it = 4;
      // ssi.l = 100;
      // ssi.D = si;
      m7 = r*c*s*8;
      n7 = 1;
      var3 = malloc(m7*n7*sizeof(double));

      dwt3(input1, row, col, sli, var3, row, col, sli,
	   r, c, s, Lo1, Hi1, Lo2, Hi2, Lo3, Hi3,
	   fLen1, fLen2, fLen3, extMethod);

      free(Lo1);
      free(Hi1);
      free(Lo2);
      free(Hi2);
      free(Lo3);
      free(Hi3);

      //CreateVar(7, "m", &mL, &nL, &l7);
      //CreateListVarFromPtr(7,1,"S",&ms,&ns,Str);
      //CreateListVarFromPtr(7,2,"I",&mi,&ni,&ssi);
      //CreateListVarFromPtr(7,3,"d",&m7, &n7, &var3);
      readFlag = swt_gwsupport_CreateHypermatOfDouble (pvApiCtx, fname, 1,  si , 4 , var3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      free(var3);
      //AssignOutputVariable(pvApiCtx,1) = 7;

      break;
    }
  case 8:
    {
      //sciprint("flow 8\n");
      //GetRhsVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname,3,  &m3, &n3 , &input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname,4,  &m4, &n4 , &input4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname,5,  &m5, &n5 , &input5 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname,6,  &m6, &n6 , &input6 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(7, "d", &m7, &n7, &l7);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname,7,  &m7, &n7 , &input7 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(8, "c", &m8, &n8, &l8);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname,8 , &input_string8 );
      m8=1;n8=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(9, "c", &m9, &n9, &l9);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname,9 , &input_string9 );
      m9=1;n9=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      dwt3_content_validate (pvApiCtx, &errCode,flow,input_string2,input_string3,input_string4,input_string5,input_string6,input_string8,input_string9);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}

      if ((col<m2*n2) || (row<m4*n4) || (sli<m6*n6))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}

      extend_method_parse (input_string9, &extMethod);

      c = (int)floor((col + m2 * n2 - 1)/2);
      r = (int)floor((row + m4 * n4 - 1)/2);
      s = (int)floor((sli + m6 * n6 - 1)/2);

      si[0] = r;
      si[1] = c;
      si[2] = s;
      si[3] = 8;
      // ssi.m = 1;
      // ssi.n = 4;
      // ssi.it = 4;
      // ssi.l = 100;
      // ssi.D = si;
      m10 = r*c*s*8;
      n10 = 1;
      var3 = malloc(m10*n10*sizeof(double));

      dwt3(input1, row, col, sli, var3, row, col, sli,
	   r, c, s, input2, input3, input4, input5,
	   input6, input7, m2*n2, m4*n4, m6*n6, extMethod);

      //CreateVar(10, "m", &mL, &nL, &l10);
      //CreateListVarFromPtr(10,1,"S",&ms,&ns,Str);
      //CreateListVarFromPtr(10,2,"I",&mi,&ni,&ssi);
      //CreateListVarFromPtr(10,3,"d",&m10, &n10, &var3);
      readFlag = swt_gwsupport_CreateHypermatOfDouble (pvApiCtx, fname, 1,  si , 4 , var3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      free(var3);
      //AssignOutputVariable(pvApiCtx,1) = 10;

      break;
    }
  default:
    sciprint("input not valid\n");
    break;
  }
  return 0;
}

int
int_idwt3 
#ifdef _SCILAB6_
(char *fname, void* pvApiCtx)
#else
(char *fname)
#endif
{
  static int l1, m1, n1, l2, m2, n2, l3, m3, n3, l4, m4, n4;
  static int l5, m5, n5, l6, m6, n6, l7, m7, n7, l8, m8, n8;
  static int l9, m9, n9, l10, m10, n10, mL1, nL1, mL2, nL2;
  static int mL3, nL3, it3, lcL3, lL3, lL2;
  static int minrhs=2, maxrhs=9, minlhs=1, maxlhs=1;
  char **Str2;
  static char *Str[]= { "hm","dims","entries"};
  int errCode, flow, family, member, ii;
  int stride1, val1, stride2, val2, stride3, val3;
  Func syn_fun;
  swt_wavelet pWaveStruct;
  extend_method extMethod;
  int mL=3, nL=1, ms=1, ns=3, mi=1, ni=3;
  int r, c, s, zero, inc, mn;
  int si[3];
  //SciIntMat ssi, M;
  int row, col, sli, blo, s3;
  double *temp, *var3, *var4, *outTemp;
  double *Lo1, *Hi1, *Lo2, *Hi2, *Lo3, *Hi3;
  int fLen1, fLen2, fLen3;
  int readFlag;
  int ndims1;
  int *dims1;
  double *input1=NULL;
  double *input2=NULL;
  double *input3=NULL;
  double *input4=NULL;
  double *input5=NULL;
  double *input6=NULL;
  double *input7=NULL;
  double *input8=NULL;
  int *int_input1=NULL;
  int *int_input2=NULL;
  int *int_input3=NULL;
  int *int_input4=NULL;
  int *int_input5=NULL;
  int *int_input6=NULL;
  int *int_input7=NULL;
  int *int_input8=NULL;
  char *input_string1=NULL;
  char *input_string2=NULL;
  char *input_string3=NULL;
  char *input_string4=NULL;
  char *input_string5=NULL;
  char *input_string6=NULL;
  char *input_string7=NULL;
  char *input_string8=NULL;

  CheckInputArgument(pvApiCtx,minrhs,maxrhs);
  CheckOutputArgument(pvApiCtx,minlhs,maxlhs);

  idwt3_form_validate (pvApiCtx, &errCode,&flow, Rhs);
  if (errCode != SUCCESS)
  {
    validate_print (errCode);
    return 0;
  }
  l1 = 0;
  l2 = 0;
  l3 = 0;
  l4 = 0;
  l5 = 0;
  l6 = 0;
  l7 = 0;
  l8 = 0;

  // GetRhsVar(1,"m",&m1,&n1,&l1);
  // CheckLength(1,m1,3);
  // GetListRhsVar(1,1,"S",&mL1,&nL1,&Str2);
  // if ( strcmp(Str2[0],"hm") != 0)
  //   {
  //     Scierror(999,"Argument %d is not an hypermatrix\r\n",1);
  //     return 0;
  //   }
  // FreeRhsSVar(Str2);
  // GetListRhsVar(1,2,"I",&mL2,&nL2,&M);
  // GetListRhsCVar(1,3,"d",&it3,&mL3,&nL3,&lL3,&lcL3);
  //
  // if (it3 == 1)
  //   {
  //     Scierror(999,"Argument %d should be real hypermatrix\r\n",1);
  //     return 0;
  //   }
  // if ((mL2 != 1) || (nL2 != 4))
  //   {
  //     Scierror(999,"Argument %d dimension error\r\n",1);
  //     return 0;
  //   }

    readFlag = swt_gwsupport_GetRealHypermatofdouble (pvApiCtx, fname, 1,  &dims1 , &ndims1 , &input1 );
    if(readFlag==SWT_GWSUPPORT_ERROR)
      {
        return 0;
      }
      if ((ndims1 != 4))
        {
          Scierror(999,"Argument %d dimension error\r\n",1);
          return 0;
        }

  // mn = mL2*nL2;
  // inc  = 1;
  // zero = 0;
  // //temp = malloc((m1*n1)*sizeof(double));
  // temp = malloc((4)*sizeof(double));
  // C2F(tpconv)(&M.it,&zero,&mn, M.D, &inc, temp, &inc);
  // row = (int)temp[0];
  // col = (int)temp[1];
  // sli = (int)temp[2];
  // blo = (int)temp[3];
  // free(temp);
  row = dims1[0];
  col = dims1[1];
  sli = dims1[2];
  blo = dims1[3];

  if (blo != 8)
    {
      sciprint("Input is not dwt3 result!\n");
      return 0;
    }

  switch (flow) {
  case 1:
    {
      //GetRhsVar(2, "c", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 2 , &input_string2 );
      m2=1;n2=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      idwt3_content_validate (pvApiCtx, &errCode,flow,input_string2,input_string3,int_input3,input_string4,int_input4,int_input5,int_input8);

      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}

      wavelet_parser(input_string2,&family,&member);
      wavelet_fun_parser (input_string2, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);

      wave_len_validate ( row, pWaveStruct.length, &stride1, &val1);
      wave_len_validate ( col, pWaveStruct.length, &stride2, &val2);
      wave_len_validate ( sli, pWaveStruct.length, &stride3, &val3);
      if ((val1 == 0) || (val2 == 0) || (val3 == 0))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}

      r = row * 2 - pWaveStruct.length + 2;
      c = col * 2 - pWaveStruct.length + 2;
      s = sli * 2 - pWaveStruct.length + 2;

      si[0] = r;
      si[1] = c;
      si[2] = s;

      // ssi.m = 1;
      // ssi.n = 3;
      // ssi.it = 4;
      // ssi.l = 100;
      // ssi.D = si;
      m3 = r*c*s;
      n3 = 1;
      var3 = malloc(m3*n3*sizeof(double));

      idwt3(input1, row, col, sli, var3, r, c, s,
	    pWaveStruct.pLowPass, pWaveStruct.pHiPass,
	    pWaveStruct.pLowPass, pWaveStruct.pHiPass,
	    pWaveStruct.pLowPass, pWaveStruct.pHiPass,
	    pWaveStruct.length, pWaveStruct.length,
	    pWaveStruct.length);

      /* output */
      //CreateVar(3, "m", &mL, &nL, &l3);
      //CreateListVarFromPtr(3,1,"S",&ms,&ns,Str);
      //CreateListVarFromPtr(3,2,"I",&mi,&ni,&ssi);
      //CreateListVarFromPtr(3,3,"d",&m3, &n3, &var3);
      readFlag = swt_gwsupport_CreateHypermatOfDouble (pvApiCtx, fname, 1,  si , 3 , var3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      free(var3);
      //AssignOutputVariable(pvApiCtx,1) = 3;
      break;
    }
  case 2:
    {
      //sciprint("flow 2\n");
      //GetRhsVar(2, "c", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 2 , &input_string2 );
      m2=1;n2=1;
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "i", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 3,  &m3, &n3 , &int_input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      idwt3_content_validate (pvApiCtx, &errCode,flow,input_string2,input_string3,int_input3,input_string4,int_input4,int_input5,int_input8);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}

      wavelet_parser(input_string2,&family,&member);
      wavelet_fun_parser (input_string2, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);

      wave_len_validate ( row, pWaveStruct.length, &stride1, &val1);
      wave_len_validate ( col, pWaveStruct.length, &stride2, &val2);
      wave_len_validate ( sli, pWaveStruct.length, &stride3, &val3);
      if ((val1 == 0) || (val2 == 0) || (val3 == 0))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}

      r = int_input3[0];
      c = int_input3[1];
      s = int_input3[2];

      if ((r>(row * 2 - pWaveStruct.length + 2)) ||
	  (c>(col * 2 - pWaveStruct.length + 2)) ||
	  (s>(sli * 2 - pWaveStruct.length + 2)))
	{
	  sciprint("size argument is not valid!\n");
	  return 0;
	}

      si[0] = r;
      si[1] = c;
      si[2] = s;

      // ssi.m = 1;
      // ssi.n = 3;
      // ssi.it = 4;
      // ssi.l = 100;
      // ssi.D = si;
      m4 = r*c*s;
      n4 = 1;
      var3 = malloc(m4*n4*sizeof(double));

      idwt3(input1, row, col, sli, var3, r, c, s,
	    pWaveStruct.pLowPass, pWaveStruct.pHiPass,
	    pWaveStruct.pLowPass, pWaveStruct.pHiPass,
	    pWaveStruct.pLowPass, pWaveStruct.pHiPass,
	    pWaveStruct.length, pWaveStruct.length,
	    pWaveStruct.length);


      //CreateVar(4, "m", &mL, &nL, &l4);
      //CreateListVarFromPtr(4,1,"S",&ms,&ns,Str);
      //CreateListVarFromPtr(4,2,"I",&mi,&ni,&ssi);
      //CreateListVarFromPtr(4,3,"d",&m4, &n4, &var3);
      readFlag = swt_gwsupport_CreateHypermatOfDouble (pvApiCtx, fname, 1,  si , 3 , var3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      free(var3);
      //AssignOutputVariable(pvApiCtx,1) = 4;
      break;
    }
  case 3:
    {
      //sciprint("flow 3\n");
      ////GetRhsVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname,3,  &m3, &n3 , &input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      idwt3_content_validate (pvApiCtx, &errCode,flow,input_string2,input_string3,int_input3,input_string4,int_input4,int_input5,int_input8);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if ((row<m2*n2) || (col<m2*n2) || (sli<m2*n2))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}

      r = row * 2 - m2 * n2 + 2;
      c = col * 2 - m2 * n2 + 2;
      s = sli * 2 - m2 * n2 + 2;

      si[0] = r;
      si[1] = c;
      si[2] = s;

      // ssi.m = 1;
      // ssi.n = 3;
      // ssi.it = 4;
      // ssi.l = 100;
      // ssi.D = si;
      m4 = r*c*s;
      n4 = 1;
      var3 = malloc(m4*n4*sizeof(double));

      idwt3(input1, row, col, sli, var3, r, c, s,
	    input2, input3, input2, input3,
	    input2, input3, m2 * n2, m2 * n2, m2 * n2);

      /* output */
      //CreateVar(4, "m", &mL, &nL, &l4);
      //CreateListVarFromPtr(4,1,"S",&ms,&ns,Str);
      //CreateListVarFromPtr(4,2,"I",&mi,&ni,&ssi);
      //CreateListVarFromPtr(4,3,"d",&m4, &n4, &var3);
      readFlag = swt_gwsupport_CreateHypermatOfDouble (pvApiCtx, fname, 1,  si , 3 , var3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      free(var3);
      //AssignOutputVariable(pvApiCtx,1) = 4;
      break;
    }
  case 4:
    {
      //sciprint("flow 4\n");
      //GetRhsVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname,3,  &m3, &n3 , &input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "i", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname,4,  &m4, &n4 , &int_input4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      idwt3_content_validate (pvApiCtx, &errCode,flow,input_string2,input_string3,int_input3,input_string4,int_input4,int_input5,int_input8);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if ((row<m2*n2) || (col<m2*n2) || (sli<m2*n2))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}

      r = int_input4[0];
      c = int_input4[1];
      s = int_input4[2];

      if ((r>(row * 2 - m2*n2 + 2)) ||
	  (c>(col * 2 - m2*n2 + 2)) ||
	  (s>(sli * 2 - m2*n2 + 2)))
	{
	  sciprint("size argument is not valid!\n");
	  return 0;
	}

      si[0] = r;
      si[1] = c;
      si[2] = s;

      // ssi.m = 1;
      // ssi.n = 3;
      // ssi.it = 4;
      // ssi.l = 100;
      // ssi.D = si;
      m5 = r*c*s;
      n5 = 1;
      var3 = malloc(m5*n5*sizeof(double));

      idwt3(input1, row, col, sli, var3, r, c, s,
	    input2, input3, input2, input3,
	    input2, input3, m2 * n2, m2 * n2, m2 * n2);

      /* output */
      //CreateVar(5, "m", &mL, &nL, &l5);
      //CreateListVarFromPtr(5,1,"S",&ms,&ns,Str);
      //CreateListVarFromPtr(5,2,"I",&mi,&ni,&ssi);
      //CreateListVarFromPtr(5,3,"d",&m5, &n5, &var3);
      readFlag = swt_gwsupport_CreateHypermatOfDouble (pvApiCtx, fname, 1,  si , 3 , var3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      free(var3);
      //AssignOutputVariable(pvApiCtx,1) = 5;
      break;
    }
  case 5:
    {
      //sciprint("flow 5\n");

      //GetRhsVar(2, "c", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 2 , &input_string2 );
      m2=1;n2=1;
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
      idwt3_content_validate (pvApiCtx, &errCode,flow,input_string2,input_string3,int_input3,input_string4,int_input4,int_input5,int_input8);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}

      wavelet_parser(input_string2,&family,&member);
      wavelet_fun_parser (input_string2, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      wave_len_validate ( col, pWaveStruct.length, &stride1, &val1);
      if (val1 == 0)
	{
	  sciprint("Input signal (column length) is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      fLen1 = pWaveStruct.length;
      Lo1 =  malloc(fLen1*sizeof(double));
      Hi1 =  malloc(fLen1*sizeof(double));
      verbatim_copy(pWaveStruct.pLowPass, fLen1, Lo1, fLen1);
      verbatim_copy(pWaveStruct.pHiPass, fLen1, Hi1, fLen1);
      c = (col * 2 - fLen1 + 2);

      wavelet_parser(input_string3,&family,&member);
      wavelet_fun_parser (input_string3, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      wave_len_validate ( row, pWaveStruct.length, &stride1, &val1);
      if (val1 == 0)
	{
	  sciprint("Input signal (row length) is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      fLen2 = pWaveStruct.length;
      Lo2 =  malloc(fLen2*sizeof(double));
      Hi2 =  malloc(fLen2*sizeof(double));
      verbatim_copy(pWaveStruct.pLowPass, fLen2, Lo2, fLen2);
      verbatim_copy(pWaveStruct.pHiPass, fLen2, Hi2, fLen2);
      r = (row * 2 - fLen2 + 2);

      wavelet_parser(input_string4,&family,&member);
      wavelet_fun_parser (input_string4, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      wave_len_validate ( sli, pWaveStruct.length, &stride1, &val1);
      if (val1 == 0)
	{
	  sciprint("Input signal (slice length) is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      fLen3 = pWaveStruct.length;
      Lo3 =  malloc(fLen3*sizeof(double));
      Hi3 =  malloc(fLen3*sizeof(double));
      verbatim_copy(pWaveStruct.pLowPass, fLen3, Lo3, fLen3);
      verbatim_copy(pWaveStruct.pHiPass, fLen3, Hi3, fLen3);
      s = (sli * 2 - fLen3 + 2);

      si[0] = r;
      si[1] = c;
      si[2] = s;

      // ssi.m = 1;
      // ssi.n = 3;
      // ssi.it = 4;
      // ssi.l = 100;
      // ssi.D = si;
      m5 = r*c*s;
      n5 = 1;
      var3 = malloc(m5*n5*sizeof(double));

      idwt3(input1, row, col, sli, var3, r, c, s,
	    Lo3, Hi3, Lo2, Hi2, Lo1, Hi1, fLen3, fLen2, fLen1);

      free(Lo1);
      free(Hi1);
      free(Lo2);
      free(Hi2);
      free(Lo3);
      free(Hi3);

      /* output */
      //CreateVar(5, "m", &mL, &nL, &l5);
      //CreateListVarFromPtr(5,1,"S",&ms,&ns,Str);
      //CreateListVarFromPtr(5,2,"I",&mi,&ni,&ssi);
      //CreateListVarFromPtr(5,3,"d",&m5, &n5, &var3);
      readFlag = swt_gwsupport_CreateHypermatOfDouble (pvApiCtx, fname, 1,  si , 3 , var3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      free(var3);
      //AssignOutputVariable(pvApiCtx,1) = 5;

      break;
    }
  case 6:
    {
      //sciprint("flow 6\n");
      //GetRhsVar(2, "c", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetScalarString(pvApiCtx, fname, 2 , &input_string2 );
      m2=1;n2=1;
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
      //GetRhsVar(5, "i", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname, 5,  &m5, &n5, &int_input5 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      idwt3_content_validate (pvApiCtx, &errCode,flow,input_string2,input_string3,int_input3,input_string4,int_input4,int_input5,int_input8);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}

      wavelet_parser(input_string2,&family,&member);
      wavelet_fun_parser (input_string2, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      wave_len_validate ( col, pWaveStruct.length, &stride1, &val1);
      if (val1 == 0)
	{
	  sciprint("Input signal (column length) is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      fLen1 = pWaveStruct.length;
      Lo1 =  malloc(fLen1*sizeof(double));
      Hi1 =  malloc(fLen1*sizeof(double));
      verbatim_copy(pWaveStruct.pLowPass, fLen1, Lo1, fLen1);
      verbatim_copy(pWaveStruct.pHiPass, fLen1, Hi1, fLen1);
      r = int_input5[0];
      c = int_input5[1];
      s = int_input5[2];
      if (c>(col * 2 - pWaveStruct.length + 2))

	{
	  sciprint("column size argument is not valid!\n");
	  return 0;
	}

      wavelet_parser(input_string3,&family,&member);
      wavelet_fun_parser (input_string3, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      wave_len_validate ( row, pWaveStruct.length, &stride1, &val1);
      if (val1 == 0)
	{
	  sciprint("Input signal (row length) is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      fLen2 = pWaveStruct.length;
      Lo2 =  malloc(fLen2*sizeof(double));
      Hi2 =  malloc(fLen2*sizeof(double));
      verbatim_copy(pWaveStruct.pLowPass, fLen2, Lo2, fLen2);
      verbatim_copy(pWaveStruct.pHiPass, fLen2, Hi2, fLen2);
      if (r>(row * 2 - pWaveStruct.length + 2))

	{
	  sciprint("row size argument is not valid!\n");
	  return 0;
	}

      wavelet_parser(input_string4,&family,&member);
      wavelet_fun_parser (input_string4, &ii);
      syn_fun = wi[ii].synthesis;
      (*syn_fun)(member, &pWaveStruct);
      wave_len_validate ( sli, pWaveStruct.length, &stride1, &val1);
      if (val1 == 0)
	{
	  sciprint("Input signal (slice length) is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}
      fLen3 = pWaveStruct.length;
      Lo3 =  malloc(fLen3*sizeof(double));
      Hi3 =  malloc(fLen3*sizeof(double));
      verbatim_copy(pWaveStruct.pLowPass, fLen3, Lo3, fLen3);
      verbatim_copy(pWaveStruct.pHiPass, fLen3, Hi3, fLen3);
      if (s>(sli * 2 - pWaveStruct.length + 2))

	{
	  sciprint("slice size argument is not valid!\n");
	  return 0;
	}

      si[0] = r;
      si[1] = c;
      si[2] = s;

      // ssi.m = 1;
      // ssi.n = 3;
      // ssi.it = 4;
      // ssi.l = 100;
      // ssi.D = si;
      m6 = r*c*s;
      n6 = 1;
      var3 = malloc(m6*n6*sizeof(double));

      idwt3(input1, row, col, sli, var3, r, c, s,
	    Lo3, Hi3, Lo2, Hi2, Lo1, Hi1, fLen3, fLen2, fLen1);

      free(Lo1);
      free(Hi1);
      free(Lo2);
      free(Hi2);
      free(Lo3);
      free(Hi3);

      /* output */
      //CreateVar(6, "m", &mL, &nL, &l6);
      //CreateListVarFromPtr(6,1,"S",&ms,&ns,Str);
      //CreateListVarFromPtr(6,2,"I",&mi,&ni,&ssi);
      //CreateListVarFromPtr(6,3,"d",&m6, &n6, &var3);
      readFlag = swt_gwsupport_CreateHypermatOfDouble (pvApiCtx, fname, 1,  si , 3 , var3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      free(var3);
      //AssignOutputVariable(pvApiCtx,1) = 6;
      break;
    }
  case 7:
    {
      //sciprint("flow 7\n");
      //GetRhsVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname,3,  &m3, &n3 , &input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname,4,  &m4, &n4 , &input4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname,5,  &m5, &n5 , &input5 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname,6,  &m6, &n6 , &input6 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(7, "d", &m7, &n7, &l7);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname,7,  &m7, &n7 , &input7 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      idwt3_content_validate (pvApiCtx, &errCode,flow,input_string2,input_string3,int_input3,input_string4,int_input4,int_input5,int_input8);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if ((row<m4*n4) || (col<m2*n2) || (sli<m6*n6))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}

      c = col * 2 - m2 * n2 + 2;
      r = row * 2 - m4 * n4 + 2;
      s = sli * 2 - m6 * n6 + 2;

      si[0] = r;
      si[1] = c;
      si[2] = s;

      // ssi.m = 1;
      // ssi.n = 3;
      // ssi.it = 4;
      // ssi.l = 100;
      // ssi.D = si;
      m8 = r*c*s;
      n8 = 1;
      var3 = malloc(m8*n8*sizeof(double));

      idwt3(input1, row, col, sli, var3, r, c, s,
	    input6, input7, input4, input5,
	    input2, input3, m6*n6, m4*n4, m2*n2);

      /* output */
      //CreateVar(8, "m", &mL, &nL, &l8);
      //CreateListVarFromPtr(8,1,"S",&ms,&ns,Str);
      //CreateListVarFromPtr(8,2,"I",&mi,&ni,&ssi);
      //CreateListVarFromPtr(8,3,"d",&m8, &n8, &var3);
      readFlag = swt_gwsupport_CreateHypermatOfDouble (pvApiCtx, fname, 1,  si ,3 , var3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      free(var3);
      //AssignOutputVariable(pvApiCtx,1) = 8;
      break;
    }
  case 8:
    {
      //sciprint("flow 8\n");
      //GetRhsVar(2, "d", &m2, &n2, &l2);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname, 2,  &m2, &n2 , &input2 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(3, "d", &m3, &n3, &l3);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname,3,  &m3, &n3 , &input3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(4, "d", &m4, &n4, &l4);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname,4,  &m4, &n4 , &input4 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(5, "d", &m5, &n5, &l5);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname,5,  &m5, &n5 , &input5 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(6, "d", &m6, &n6, &l6);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname,6,  &m6, &n6 , &input6 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(7, "d", &m7, &n7, &l7);
      readFlag = swt_gwsupport_GetRealMatrixOfDoubles (pvApiCtx, fname,7,  &m7, &n7 , &input7 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      //GetRhsVar(8, "i", &m8, &n8, &l8);
      readFlag = swt_gwsupport_GetRealMatrixOfDoublesAsInteger (pvApiCtx, fname,8,  &m8, &n8, &int_input8 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      idwt3_content_validate (pvApiCtx, &errCode,flow,input_string2,input_string3,int_input3,input_string4,int_input4,int_input5,int_input8);
      if (errCode != SUCCESS)
	{
	  validate_print (errCode);
	  return 0;
	}
      if ((row<m4*n4) || (col<m2*n2) || (sli<m6*n6))
	{
	  sciprint("Input signal is not valid for selected decompostion level and wavelets!\n");
	  return 0;
	}

      r = int_input8[0];
      c = int_input8[1];
      s = int_input8[2];

      if ((r>(row * 2 - m4*n4 + 2)) ||
	  (c>(col * 2 - m2*n2 + 2)) ||
	  (s>(sli * 2 - m6*n6 + 2)))
	{
	  sciprint("size argument is not valid!\n");
	  return 0;
	}
      //c = col * 2 - m2 * n2 + 2;
      //r = row * 2 - m4 * n4 + 2;
      //s = sli * 2 - m6 * n6 + 2;

      si[0] = r;
      si[1] = c;
      si[2] = s;

      // ssi.m = 1;
      // ssi.n = 3;
      // ssi.it = 4;
      // ssi.l = 100;
      // ssi.D = si;
      m9 = r*c*s;
      n9 = 1;
      var3 = malloc(m9*n9*sizeof(double));

      idwt3(input1, row, col, sli, var3, r, c, s,
	    input6, input7, input4, input5,
	    input2, input3, m6*n6, m4*n4, m2*n2);

      /* output */
      //CreateVar(9, "m", &mL, &nL, &l9);
      //CreateListVarFromPtr(9,1,"S",&ms,&ns,Str);
      //CreateListVarFromPtr(9,2,"I",&mi,&ni,&ssi);
      //CreateListVarFromPtr(9,3,"d",&m9, &n9, &var3);
      readFlag = swt_gwsupport_CreateHypermatOfDouble (pvApiCtx, fname, 1,  si , 3 , var3 );
      if(readFlag==SWT_GWSUPPORT_ERROR)
        {
          return 0;
        }
      free(var3);
      //AssignOutputVariable(pvApiCtx,1) = 9;
      break;
    }
  default:
    sciprint("input not valid\n");
    break;
  }
  return 0;
}
