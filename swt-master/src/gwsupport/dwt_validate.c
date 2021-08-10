/*
 * -------------------------------------------------------------------------
 * dwt_validate.c -- DWT validation
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
 #include "swtlib.h"
 #include "swt_gwsupport.h"
 #include "api_scilab.h"
 #include "Scierror.h"
 //#include "localization.h"
 //#include "warningmode.h"
 #include "sciprint.h"


 void
 dwt_print ()
 {
   sciprint("\n**********************************************\n");
   switch (getdwtMode()) {
     case ZPD:
     {
       sciprint("**     DWT Extension Mode: Zero Padding     **\n");
       break;
     }
     case SYMH:
     {
       sciprint("** DWT Extension Mode: Half Symmetrization  **\n");
       break;
     }
     case SYMW:
     {
       sciprint("** DWT Extension Mode: Whole Symmetrization **\n");
       break;
     }
     case ASYMH:
     {
       sciprint("** DWT Extension Mode: Half Asymmetrization **\n");
       break;
     }
     case ASYMW:
     {
       sciprint("** DWT Extension Mode: Whole Asymmetrization**\n");
       break;
     }
     case SP0:
     {
       sciprint("** DWT Extension Mode: order 0 smooth padding*\n");
       break;
     }
     case SP1:
     {
       sciprint("** DWT Extension Mode: order 1 smooth padding*\n");
       break;
     }
     case PPD:
     {
       sciprint("**    DWT Extension Mode: Periodic Padding  **\n");
       break;
     }
     case PER:
     {
       sciprint("**    DWT Extension Mode: Periodization     **\n");
       break;
     }
     default:
     break;
   }
   sciprint("**********************************************\n");
   return;
 }


/*-------------------------------------------
 * orthfilt validation
 *-----------------------------------------*/

void
orthfilt_form_validate (void * pvApiCtx, int *errCode)
{
  *errCode = SUCCESS;
  if (!sci_matrix_vector_real(pvApiCtx,1))
    *errCode = UNKNOWN_INPUT_ERR;
  return;
}

/*-------------------------------------------
 * biorthfilt validation
 *-----------------------------------------*/

void
biorfilt_form_validate (void * pvApiCtx, int *errCode)
{
  *errCode = SUCCESS;
  if ((!sci_matrix_vector_real(pvApiCtx,1)) || (!sci_matrix_vector_real(pvApiCtx,2)))
    *errCode = UNKNOWN_INPUT_ERR;
  return;
}

/*-------------------------------------------
 * dbwavf validation
 *-----------------------------------------*/

void
dbwavf_form_validate (void * pvApiCtx, int *errCode)
{
  *errCode = SUCCESS;
  if (!sci_strings_scalar(pvApiCtx,1))
    *errCode = UNKNOWN_INPUT_ERR;
  return;
}

void
dbwavf_content_validate (void * pvApiCtx, int *errCode, char *wname)
{
  int type;
  *errCode = SUCCESS;
  wavelet_family_check(wname,DAUBECHIES,&type);
  if (!type)
    *errCode = WAVELET_NAME_NOT_VALID;
  return;
}


/*-------------------------------------------
 * coifwavf validation
 *-----------------------------------------*/

void
coifwavf_form_validate (void * pvApiCtx, int *errCode)
{
  *errCode = SUCCESS;
  if (!sci_strings_scalar(pvApiCtx,1))
    *errCode = UNKNOWN_INPUT_ERR;
  return;
}

void
coifwavf_content_validate (void * pvApiCtx, int *errCode, char *wname)
{
  int type;
  *errCode = SUCCESS;
  wavelet_family_check(wname,COIFLETS,&type);
  if (!type)
    *errCode = WAVELET_NAME_NOT_VALID;
  return;
}



/*-------------------------------------------
 * symwavf validation
 *-----------------------------------------*/

void
symwavf_form_validate (void * pvApiCtx, int *errCode)
{
  *errCode = SUCCESS;
  if (!sci_strings_scalar(pvApiCtx,1))
    *errCode = UNKNOWN_INPUT_ERR;
  return;
}

void
symwavf_content_validate (void * pvApiCtx, int *errCode, char *wname)
{
  int type;
  *errCode = SUCCESS;
  wavelet_family_check(wname,SYMLETS,&type);
  if (!type)
    *errCode = WAVELET_NAME_NOT_VALID;
  return;
}

/*-------------------------------------------
 * legdwavf validation
 *-----------------------------------------*/

void
legdwavf_form_validate (void * pvApiCtx, int *errCode)
{
  *errCode = SUCCESS;
  if (!sci_strings_scalar(pvApiCtx,1))
    *errCode = UNKNOWN_INPUT_ERR;
  return;
}

void
legdwavf_content_validate (void * pvApiCtx, int *errCode, char *wname)
{
  int type;
  *errCode = SUCCESS;
  wavelet_family_check(wname,LEGENDRE,&type);
  if (!type)
    *errCode = WAVELET_NAME_NOT_VALID;
  return;
}


/*-------------------------------------------
 * biorwavf validation
 *-----------------------------------------*/

void
biorwavf_form_validate (void * pvApiCtx, int *errCode)
{
  *errCode = SUCCESS;
  if (!sci_strings_scalar(pvApiCtx,1))
    *errCode = UNKNOWN_INPUT_ERR;
  return;
}

void
biorwavf_content_validate (void * pvApiCtx, int *errCode, char *wname)
{
  int type;
  *errCode = SUCCESS;
  wavelet_family_check(wname,SPLINE_BIORTH,&type);
  if (!type)
    *errCode = WAVELET_NAME_NOT_VALID;
  return;
}

/*-------------------------------------------
 * rbiorwavf validation
 *-----------------------------------------*/

void
rbiorwavf_form_validate (void * pvApiCtx, int *errCode)
{
  *errCode = SUCCESS;
  if (!sci_strings_scalar(pvApiCtx,1))
    *errCode = UNKNOWN_INPUT_ERR;
  return;
}

void
rbiorwavf_content_validate (void * pvApiCtx, int *errCode, char *wname)
{
  int type;
  *errCode = SUCCESS;
  wavelet_family_check(wname,SPLINE_RBIORTH,&type);
  if (!type)
    *errCode = WAVELET_NAME_NOT_VALID;
  return;
}


/*-------------------------------------------
 * wfilters validation
 *-----------------------------------------*/

void
wfilters_form_validate (void * pvApiCtx, int *errCode, int *flow, char *input_string1, int NInputArgument, int NOutputArgument)
{

  *errCode = SUCCESS;
  if ((NInputArgument==2) && (!sci_strings_scalar(pvApiCtx,2)))
    {
      *errCode = UNKNOWN_INPUT_ERR;
      return;
    }
  if ((NInputArgument==1) && sci_strings_scalar(pvApiCtx,1) && (NOutputArgument==4))
    *flow = 1;
  else if ((NInputArgument==2) && sci_strings_scalar(pvApiCtx,1) && (NOutputArgument==2) &&
  input_string1[0]=='d')
    *flow = 2;
  else if ((NInputArgument==2) && sci_strings_scalar(pvApiCtx,1) && (NOutputArgument==2) &&
  input_string1[0]=='r')
    *flow = 3;
  else if ((NInputArgument==2) && sci_strings_scalar(pvApiCtx,1) && (NOutputArgument==2) &&
  input_string1[0]=='l')
    *flow = 4;
  else if ((NInputArgument==2) && sci_strings_scalar(pvApiCtx,1) && (NOutputArgument==2) &&
  input_string1[0]=='h')
    *flow = 5;
  else
	  *errCode = UNKNOWN_INPUT_ERR;
  return;
}

void
wfilters_content_validate(void * pvApiCtx, int *errCode, char *wname)
{
  int typ1, typ2, typ3, typ4, typ5, typ6, typ7, typ8, typ9, typ10, typ11;
  *errCode = SUCCESS;
  wavelet_family_check(wname,DAUBECHIES,&typ1);
  wavelet_family_check(wname,COIFLETS,&typ2);
  wavelet_family_check(wname,SYMLETS,&typ3);
  wavelet_family_check(wname,SPLINE_BIORTH,&typ4);
  wavelet_family_check(wname,HAAR,&typ5);
  wavelet_family_check(wname,BEYLKIN,&typ6);
  wavelet_family_check(wname,VAIDYANATHAN,&typ7);
  wavelet_family_check(wname,DMEY,&typ8);
  wavelet_family_check(wname,BATHLETS,&typ9);
  wavelet_family_check(wname,LEGENDRE,&typ10);
  wavelet_family_check(wname,SPLINE_RBIORTH,&typ11);
  //wavelet_family_check(wname,FARRAS,&typ12);
  //wavelet_family_check(wname,KINGSBURYQ,&typ13);
  if ((!typ1) && (!typ2) && (!typ3) && (!typ4) && (!typ5) && (!typ6) && (!typ7) && (!typ8) && (!typ9) && (!typ10) && (!typ11))
    *errCode = WAVELET_NAME_NOT_VALID;
  return;
}

/*-------------------------------------------
 * wmaxlev validation
 *-----------------------------------------*/

void
wmaxlev_form_validate(void * pvApiCtx, int *errCode)
{
  *errCode = UNKNOWN_INPUT_ERR;
  if (sci_matrix_scalar_real(pvApiCtx,1) && sci_strings_scalar(pvApiCtx,2))
    *errCode = SUCCESS;
  else if (sci_matrix_vector_real(pvApiCtx,1) &&
	   sci_strings_scalar(pvApiCtx,2) && length_check(pvApiCtx,1,2))
    *errCode = SUCCESS;
  return;
}

/*-------------------------------------------
 * dwt validation
 *-----------------------------------------*/

void
dwt_form_validate(void * pvApiCtx, int *errCode, int *flow, int NInputArgument)
{
  *errCode = SUCCESS;
  if ((NInputArgument==2) && sci_matrix_vector_real(pvApiCtx,1) &&
      sci_strings_scalar(pvApiCtx,2))
    *flow = 1;
  else if ((NInputArgument==3) && sci_matrix_vector_real(pvApiCtx,1) &&
	   sci_matrix_vector_real(pvApiCtx,2) &&
	   sci_matrix_vector_real(pvApiCtx,3) && vector_length_check(pvApiCtx,2,3))
    *flow = 2;
  else if ((NInputArgument==4) && sci_matrix_vector_real(pvApiCtx,1) &&
	   sci_strings_scalar(pvApiCtx,2) && sci_strings_scalar(pvApiCtx,3) &&
	   sci_strings_scalar(pvApiCtx,4))
    *flow = 3;
  else if ((NInputArgument==5) && sci_matrix_vector_real(pvApiCtx,1) &&
	   sci_matrix_vector_real(pvApiCtx,2) && sci_matrix_vector_real(pvApiCtx,3) &&
	   vector_length_check(pvApiCtx,2,3) &&
	   sci_strings_scalar(pvApiCtx,4) && sci_strings_scalar(pvApiCtx,5))
    *flow = 4;
  else
    *errCode = UNKNOWN_INPUT_ERR;
  return;
}

void
dwt_content_validate(void * pvApiCtx, int *errCode, int flow, char * string1, char * string2, char * string3)
{
  int type;

  *errCode = SUCCESS;
  switch (flow) {
  case 1:
    {
      wfilters_content_validate(pvApiCtx,errCode, string1);
      break;
    }
  case 2:
    {
      break;
    }
  case 3:
    {
      wfilters_content_validate(pvApiCtx,errCode, string1);
      extension_check(string3,&type);
      if (!type)
	*errCode = EXTENSION_OPT_NOT_VALID;
      if (strcmp(string2,"mode"))
	*errCode = UNKNOWN_INPUT_ERR;
      break;
    }
  case 4:
    {
      extension_check(string2,&type);
      if (!type)
	*errCode = EXTENSION_OPT_NOT_VALID;
      if (strcmp(string1,"mode"))
	*errCode = UNKNOWN_INPUT_ERR;
      break;
    }
  default:
    break;
  }
  return;
}


/*-------------------------------------------
 * idwt validation
 *-----------------------------------------*/

void
idwt_form_validate (void * pvApiCtx, int *errCode, int *flow, int NInputArgument)
{
  *errCode = SUCCESS;

  if ((NInputArgument==3) && sci_matrix_vector_real(pvApiCtx,1) &&
      sci_matrix_vector_real(pvApiCtx,2) && sci_strings_scalar(pvApiCtx,3) &&
      vector_length_check(pvApiCtx,1,2))
    *flow = 1;
  else if ((NInputArgument==4) && sci_matrix_vector_real(pvApiCtx,1) &&
	   sci_matrix_vector_real(pvApiCtx,2) && vector_length_check(pvApiCtx,1,2) &&
	   sci_matrix_vector_real(pvApiCtx,3) && sci_matrix_vector_real(pvApiCtx,4) &&
	   vector_length_check(pvApiCtx,3,4))
    *flow = 2;
  else if ((NInputArgument==4) && sci_matrix_vector_real(pvApiCtx,1) &&
	   sci_matrix_vector_real(pvApiCtx,2) && vector_length_check(pvApiCtx,1,2) &&
	   sci_strings_scalar(pvApiCtx,3) && sci_matrix_scalar_real(pvApiCtx,4))
    *flow = 3;
  else if ((NInputArgument==5) && sci_matrix_vector_real(pvApiCtx,1) &&
	   sci_matrix_vector_real(pvApiCtx,2) && vector_length_check(pvApiCtx,1,2) &&
	   sci_matrix_vector_real(pvApiCtx,3) && sci_matrix_vector_real(pvApiCtx,4) &&
	   vector_length_check(pvApiCtx,3,4) && sci_matrix_scalar_real(pvApiCtx,5))
    *flow = 4;
  else if ((NInputArgument==5) && sci_matrix_vector_real(pvApiCtx,1) &&
	   sci_matrix_vector_real(pvApiCtx,2) && vector_length_check(pvApiCtx,1,2) &&
	   sci_strings_scalar(pvApiCtx,3) && sci_strings_scalar(pvApiCtx,4) &&
	   sci_strings_scalar(pvApiCtx,5))
    *flow = 5;
  else if ((NInputArgument==6) && sci_matrix_vector_real(pvApiCtx,1) &&
	   sci_matrix_vector_real(pvApiCtx,2) && vector_length_check(pvApiCtx,1,2) &&
	   sci_strings_scalar(pvApiCtx,3) && sci_matrix_scalar_real(pvApiCtx,4) &&
	   sci_strings_scalar(pvApiCtx,5) && sci_strings_scalar(pvApiCtx,6))
    *flow = 6;
  else if ((NInputArgument==6) && sci_matrix_vector_real(pvApiCtx,1) &&
	   sci_matrix_vector_real(pvApiCtx,2) && vector_length_check(pvApiCtx,1,2) &&
	   sci_matrix_vector_real(pvApiCtx,3) && sci_matrix_vector_real(pvApiCtx,4) &&
	   vector_length_check(pvApiCtx,3,4) && sci_strings_scalar(pvApiCtx,5) &&
	   sci_strings_scalar(pvApiCtx,6))
    *flow = 7;
  else if ((NInputArgument==7) && sci_matrix_vector_real(pvApiCtx,1) &&
	   sci_matrix_vector_real(pvApiCtx,2) && vector_length_check(pvApiCtx,1,2) &&
	   sci_matrix_vector_real(pvApiCtx,3) && sci_matrix_vector_real(pvApiCtx,4) &&
	   vector_length_check(pvApiCtx,3,4) && sci_matrix_scalar_real(pvApiCtx,5) &&
	   sci_strings_scalar(pvApiCtx,6) && sci_strings_scalar(pvApiCtx,7))
    *flow = 8;
  else if ((NInputArgument==3) &&
	   ((sci_matrix_vector_real(pvApiCtx,1) && sci_matrix_void(pvApiCtx,2)) ||
	    (sci_matrix_void(pvApiCtx,1) && sci_matrix_vector_real(pvApiCtx,2))) &&
	   sci_strings_scalar(pvApiCtx,3))
    *flow = 1;
  else if ((NInputArgument==4) &&
	   ((sci_matrix_vector_real(pvApiCtx,1) && sci_matrix_void(pvApiCtx,2)) ||
	    (sci_matrix_void(pvApiCtx,1) && sci_matrix_vector_real(pvApiCtx,2))) &&
	   sci_matrix_vector_real(pvApiCtx,3) && sci_matrix_vector_real(pvApiCtx,4) &&
	   vector_length_check(pvApiCtx,3,4))
    *flow = 2;
  else if ((NInputArgument==4) &&
	   ((sci_matrix_vector_real(pvApiCtx,1) && sci_matrix_void(pvApiCtx,2)) ||
	    (sci_matrix_void(pvApiCtx,1) && sci_matrix_vector_real(pvApiCtx,2))) &&
	   sci_strings_scalar(pvApiCtx,3) && sci_matrix_scalar_real(pvApiCtx,4))
    *flow = 3;
  else if ((NInputArgument==5) &&
	   ((sci_matrix_vector_real(pvApiCtx,1) && sci_matrix_void(pvApiCtx,2)) ||
	    (sci_matrix_void(pvApiCtx,1) && sci_matrix_vector_real(pvApiCtx,2))) &&
	   sci_matrix_vector_real(pvApiCtx,3) && sci_matrix_vector_real(pvApiCtx,4) &&
	   vector_length_check(pvApiCtx,3,4) && sci_matrix_scalar_real(pvApiCtx,5))
    *flow = 4;
  else if ((NInputArgument==5) &&
	   ((sci_matrix_vector_real(pvApiCtx,1) && sci_matrix_void(pvApiCtx,2)) ||
	    (sci_matrix_void(pvApiCtx,1) && sci_matrix_vector_real(pvApiCtx,2))) &&
	   sci_strings_scalar(pvApiCtx,3) && sci_strings_scalar(pvApiCtx,4) &&
	   sci_strings_scalar(pvApiCtx,5))
    *flow = 5;
  else if ((NInputArgument==6) &&
	   ((sci_matrix_vector_real(pvApiCtx,1) && sci_matrix_void(pvApiCtx,2)) ||
	    (sci_matrix_void(pvApiCtx,1) && sci_matrix_vector_real(pvApiCtx,2))) &&
	   sci_strings_scalar(pvApiCtx,3) && sci_matrix_scalar_real(pvApiCtx,4) &&
	   sci_strings_scalar(pvApiCtx,5) && sci_strings_scalar(pvApiCtx,6))
    *flow = 6;
  else if ((NInputArgument==6) &&
	   ((sci_matrix_vector_real(pvApiCtx,1) && sci_matrix_void(pvApiCtx,2)) ||
	    (sci_matrix_void(pvApiCtx,1) && sci_matrix_vector_real(pvApiCtx,2))) &&
	   sci_matrix_vector_real(pvApiCtx,3) && sci_matrix_vector_real(pvApiCtx,4) &&
	   vector_length_check(pvApiCtx,3,4) && sci_strings_scalar(pvApiCtx,5) &&
	   sci_strings_scalar(pvApiCtx,6))
    *flow = 7;
  else if ((NInputArgument==7) &&
	   ((sci_matrix_vector_real(pvApiCtx,1) && sci_matrix_void(pvApiCtx,2)) ||
	    (sci_matrix_void(pvApiCtx,1) && sci_matrix_vector_real(pvApiCtx,2))) &&
	   sci_matrix_vector_real(pvApiCtx,3) && sci_matrix_vector_real(pvApiCtx,4) &&
	   vector_length_check(pvApiCtx,3,4) && sci_matrix_scalar_real(pvApiCtx,5) &&
	   sci_strings_scalar(pvApiCtx,6) && sci_strings_scalar(pvApiCtx,7))
    *flow = 8;
  else
    *errCode = UNKNOWN_INPUT_ERR;
  return;
}

void
idwt_content_validate (void * pvApiCtx, int *errCode, int flow,
		       char * l3, int* l4, int* l5, char* l4_string, char* l5_string, char* l6, char* l7)
{
  int type;

  *errCode = SUCCESS;
  switch (flow) {
  case 1:
    {
      wfilters_content_validate(pvApiCtx,errCode, (l3));
      break;
    }
  case 2:
    {
      break;
    }
  case 3:
    {
      wfilters_content_validate(pvApiCtx,errCode, (l3));
      if ((l4)[0] <= 0)
	*errCode = POSITIVE_INTEGER_ONLY;
      break;
    }
  case 4:
    {
      if ((l5)[0] <= 0)
	*errCode = POSITIVE_INTEGER_ONLY;
      break;
    }
  case 5:
    {
      wfilters_content_validate(pvApiCtx,errCode, (l3));
      if (strcmp(l4_string,"mode"))
	*errCode = UNKNOWN_INPUT_ERR;
      extension_check(l5_string,&type);
      if (!type)
	*errCode = EXTENSION_OPT_NOT_VALID;
      break;
    }
  case 6:
    {
      wfilters_content_validate(pvApiCtx,errCode, (l3));
      if (strcmp(l5_string,"mode"))
	*errCode = UNKNOWN_INPUT_ERR;
      extension_check((l6),&type);
      if (!type)
	*errCode = EXTENSION_OPT_NOT_VALID;
      if ((l4)[0] <= 0)
	*errCode = POSITIVE_INTEGER_ONLY;
      break;
    }
  case 7:
    {
      if (strcmp(l5_string,"mode"))
	*errCode = UNKNOWN_INPUT_ERR;
      extension_check((l6),&type);
      if (!type)
	*errCode = EXTENSION_OPT_NOT_VALID;
      break;
    }
  case 8:
    {
      if (strcmp((l6),"mode"))
	*errCode = UNKNOWN_INPUT_ERR;
      extension_check((l7),&type);
      if (!type)
	*errCode = EXTENSION_OPT_NOT_VALID;
      if ((l5)[0] <= 0)
	*errCode = POSITIVE_INTEGER_ONLY;
      break;
    }
  default:
    break;
  }
  return;
}

/*-------------------------------------------
 * wavedec validation
 *-----------------------------------------*/

void
wavedec_form_validate(void * pvApiCtx, int *errCode, int *flow, int NInputArgument)
{
  *errCode = SUCCESS;
  if ((NInputArgument==3) && (sci_matrix_vector_real(pvApiCtx,1))&&
      sci_matrix_scalar_real(pvApiCtx,2) && sci_strings_scalar(pvApiCtx,3))
    *flow = 1;
  else if ((NInputArgument==4) && sci_matrix_vector_real(pvApiCtx,1) &&
	   sci_matrix_scalar_real(pvApiCtx,2) &&
	   sci_matrix_vector_real(pvApiCtx,3) &&
	   sci_matrix_vector_real(pvApiCtx,4) &&
	   vector_length_check(pvApiCtx,3,4))
    *flow = 2;
  else
    *errCode = UNKNOWN_INPUT_ERR;
  return;
}

void
wavedec_content_validate(void * pvApiCtx, int *errCode, int flow, int* int1, char* string1)
{
  *errCode = SUCCESS;
  switch (flow) {
  case 1:
    {
      wfilters_content_validate(pvApiCtx,errCode,string1);
      if (int1[0]<=0)
	*errCode = POSITIVE_INTEGER_ONLY;
      break;
    }
  case 2:
    {
      if (int1[0]<=0)
	*errCode = POSITIVE_INTEGER_ONLY;
      break;
    }
  default:
    break;
  }
  return;
}

/*-------------------------------------------
 * waverec validation
 *-----------------------------------------*/

void
waverec_form_validate(void * pvApiCtx, int *errCode, int *flow, int NInputArgument)
{
  *errCode = SUCCESS;
  if ((NInputArgument==3) && (sci_matrix_vector_real(pvApiCtx,1))&&
      sci_matrix_vector_real(pvApiCtx,2) && sci_strings_scalar(pvApiCtx,3))
    *flow = 1;
  else if ((NInputArgument==4) && sci_matrix_vector_real(pvApiCtx,1) &&
	   sci_matrix_vector_real(pvApiCtx,2) &&
	   sci_matrix_vector_real(pvApiCtx,3) &&
	   sci_matrix_vector_real(pvApiCtx,4) &&
	   vector_length_check(pvApiCtx,3,4))
    *flow = 2;
  else
    *errCode = UNKNOWN_INPUT_ERR;
  return;
}

void
waverec_content_validate(void * pvApiCtx, int *errCode, int flow, char* l3)
{
  *errCode = SUCCESS;
  switch (flow) {
  case 1:
    {
      wfilters_content_validate(pvApiCtx,errCode,(l3));
      break;
    }
  case 2:
    {
      break;
    }
  default:
    break;
  }
  return;
}

/*-------------------------------------------
 * wrcoef validation
 *-----------------------------------------*/

void
wrcoef_form_validate(void * pvApiCtx, int *errCode, int *flow, int NInputArgument)
{
  *errCode = SUCCESS;

  if ((NInputArgument==4) && sci_strings_scalar(pvApiCtx,1) &&
      sci_matrix_vector_real(pvApiCtx,2) && sci_matrix_vector_real(pvApiCtx,3) &&
      sci_strings_scalar(pvApiCtx,4))
    *flow = 1;
  else if ((NInputArgument==5) && sci_strings_scalar(pvApiCtx,1) &&
	   sci_matrix_vector_real(pvApiCtx,2) && sci_matrix_vector_real(pvApiCtx,3) &&
	   sci_strings_scalar(pvApiCtx,4) && sci_matrix_scalar_real(pvApiCtx,5))
    *flow = 2;
  else if ((NInputArgument==5) && sci_strings_scalar(pvApiCtx,1) &&
	   sci_matrix_vector_real(pvApiCtx,2) && sci_matrix_vector_real(pvApiCtx,3) &&
	   sci_matrix_vector_real(pvApiCtx,4) && sci_matrix_vector_real(pvApiCtx,5) &&
	   vector_length_check(pvApiCtx,4,5))
    *flow = 3;
  else if ((NInputArgument==6) && sci_strings_scalar(pvApiCtx,1) &&
	   sci_matrix_vector_real(pvApiCtx,2) && sci_matrix_vector_real(pvApiCtx,3) &&
	   sci_matrix_vector_real(pvApiCtx,4) && sci_matrix_vector_real(pvApiCtx,5) &&
	   sci_matrix_scalar_real(pvApiCtx,6) && vector_length_check(pvApiCtx,4,5))
    *flow = 4;
  else
    *errCode = UNKNOWN_INPUT_ERR;
  return;
}

void
wrcoef_content_validate (void * pvApiCtx, int *errCode, int flow, char *l1, char* l4, int *l5, int* l6)
{
  *errCode = SUCCESS;
  switch (flow){
  case 1:
    {
      wfilters_content_validate(pvApiCtx,errCode,(l4));
      if (scalar_string_check((l1),'a') ||
	  scalar_string_check((l1),'d'))
	*errCode = SUCCESS;
      else
	*errCode = UNKNOWN_INPUT_ERR;
      break;
    }
  case 2:
    {
      wfilters_content_validate(pvApiCtx,errCode,(l4));
      if (scalar_string_check((l1),'a') ||
	  scalar_string_check((l1),'d'))
	*errCode = SUCCESS;
      else
	*errCode = UNKNOWN_INPUT_ERR;
      if ((scalar_string_check((l1),'a') && ((l5)[0] >= 0)) ||
	  (scalar_string_check((l1),'d') && ((l5)[0] > 0) ))
	*errCode = SUCCESS;
      else
	*errCode = UNKNOWN_INPUT_ERR;
      break;
    }
  case 3:
    {
      if (scalar_string_check((l1),'a') ||
	  scalar_string_check((l1),'d'))
	*errCode = SUCCESS;
      else
	*errCode = OPT_CHAR_NOT_VALID;
      break;
    }
  case 4:
    {
      if (scalar_string_check((l1),'a') ||
	  scalar_string_check((l1),'d'))
	*errCode = SUCCESS;
      else
	*errCode = UNKNOWN_INPUT_ERR;
      if ((scalar_string_check((l1),'a') && ((l6)[0] >= 0)) ||
	  (scalar_string_check((l1),'d') && ((l6)[0] > 0) ))
	*errCode = SUCCESS;
      else
	*errCode = UNKNOWN_INPUT_ERR;
      break;
    }
  default:
    break;
  }
  return;
}

/*-------------------------------------------
 * appcoef validation
 *-----------------------------------------*/

void
appcoef_form_validate (void * pvApiCtx, int *errCode, int *flow, int NInputArgument)
{
  *errCode = SUCCESS;
  if ((NInputArgument==3) && sci_matrix_vector_real(pvApiCtx,1) &&
      sci_matrix_vector_real(pvApiCtx,2) && sci_strings_scalar(pvApiCtx,3))
    *flow = 1;
  else if ((NInputArgument==4) && sci_matrix_vector_real(pvApiCtx,1) &&
	   sci_matrix_vector_real(pvApiCtx,2) && sci_strings_scalar(pvApiCtx,3) &&
	   sci_matrix_scalar_real(pvApiCtx,4) )
    *flow = 2;
  else if ((NInputArgument==4) && sci_matrix_vector_real(pvApiCtx,1) &&
	   sci_matrix_vector_real(pvApiCtx,2) && sci_matrix_vector_real(pvApiCtx,3) &&
	   sci_matrix_vector_real(pvApiCtx,4) && vector_length_check(pvApiCtx,3,4))
    *flow = 3;
  else if ((NInputArgument==5) && sci_matrix_vector_real(pvApiCtx,1) &&
	   sci_matrix_vector_real(pvApiCtx,2) && sci_matrix_vector_real(pvApiCtx,3) &&
	   sci_matrix_vector_real(pvApiCtx,4) && vector_length_check(pvApiCtx,3,4) &&
	   sci_matrix_scalar_real(pvApiCtx,5))
    *flow = 4;
  else
    *errCode = UNKNOWN_INPUT_ERR;
  return;
}

void
appcoef_content_validate (void * pvApiCtx, int *errCode, int flow, char* input3)
{
  *errCode = SUCCESS;
  switch (flow) {
  case 1:
    {
      wfilters_content_validate(pvApiCtx,errCode,(input3));
      break;
    }
  case 2:
    {
      wfilters_content_validate(pvApiCtx,errCode,(input3));
      break;
    }
  case 3:
    {
      break;
    }
  case 4:
    {
      break;
    }
  default:
    break;
  }
  return;
}

/*-------------------------------------------
 * detcoef validation
 *-----------------------------------------*/

void
detcoef_form_validate (void * pvApiCtx, int *errCode, int *flow, int NInputArgument)
{
  *errCode = SUCCESS;
  if ((NInputArgument==2) && sci_matrix_vector_real(pvApiCtx,1) &&
      sci_matrix_vector_real(pvApiCtx,2))
    *flow = 1;
  else if ((NInputArgument==3) && sci_matrix_vector_real(pvApiCtx,1) &&
	   sci_matrix_vector_real(pvApiCtx,2) && sci_matrix_scalar_real(pvApiCtx,3))
    *flow = 2;
  else
    *errCode = UNKNOWN_INPUT_ERR;
  return;
}

/*-------------------------------------------
 * wenergy validation
 *-----------------------------------------*/

void
wenergy_form_validate (void * pvApiCtx, int *errCode, int NInputArgument)
{
  *errCode = UNKNOWN_INPUT_ERR;
  if ((NInputArgument==2) && sci_matrix_vector_real(pvApiCtx,1) &&
      sci_matrix_vector_real(pvApiCtx,2))
    *errCode = SUCCESS;
  return;
}

/*-------------------------------------------
 * upcoef validation
 *-----------------------------------------*/

void
upcoef_form_validate (void * pvApiCtx, int *errCode, int *flow, int NInputArgument)
{
  *errCode = SUCCESS;
  if ((NInputArgument==3) && sci_strings_scalar(pvApiCtx,1) &&
      (sci_matrix_vector_real(pvApiCtx,2) || sci_matrix_scalar_real(pvApiCtx,2)) && sci_strings_scalar(pvApiCtx,3))
    *flow = 5;
  else if ((NInputArgument==4) && sci_strings_scalar(pvApiCtx,1) &&
	   (sci_matrix_vector_real(pvApiCtx,2) || sci_matrix_scalar_real(pvApiCtx,2)) && sci_strings_scalar(pvApiCtx,3) &&
	   sci_matrix_scalar_real(pvApiCtx,4))
    *flow = 1;
  else if ((NInputArgument==4) && sci_strings_scalar(pvApiCtx,1) &&
	   (sci_matrix_vector_real(pvApiCtx,2) || sci_matrix_scalar_real(pvApiCtx,2)) && sci_matrix_vector_real(pvApiCtx,3) &&
	   sci_matrix_vector_real(pvApiCtx,4) && vector_length_check(pvApiCtx,3,4))
    *flow = 6;
  else if ((NInputArgument==5) && sci_strings_scalar(pvApiCtx,1) &&
	   (sci_matrix_vector_real(pvApiCtx,2) || sci_matrix_scalar_real(pvApiCtx,2)) && sci_strings_scalar(pvApiCtx,3) &&
	   sci_matrix_scalar_real(pvApiCtx,4) && sci_matrix_scalar_real(pvApiCtx,5))
    *flow = 2;
  else if ((NInputArgument==5) && sci_strings_scalar(pvApiCtx,1) &&
	   (sci_matrix_vector_real(pvApiCtx,2) || sci_matrix_scalar_real(pvApiCtx,2)) && sci_matrix_vector_real(pvApiCtx,3) &&
	   sci_matrix_vector_real(pvApiCtx,4) && vector_length_check(pvApiCtx,3,4) &&
	   sci_matrix_scalar_real(pvApiCtx,5))
    *flow = 3;
  else if ((NInputArgument==6) && sci_strings_scalar(pvApiCtx,1) &&
	   (sci_matrix_vector_real(pvApiCtx,2) || sci_matrix_scalar_real(pvApiCtx,2)) && sci_matrix_vector_real(pvApiCtx,3) &&
	   sci_matrix_vector_real(pvApiCtx,4) && vector_length_check(pvApiCtx,3,4) &&
	   sci_matrix_scalar_real(pvApiCtx,5) && sci_matrix_scalar_real(pvApiCtx,6))
    *flow = 4;
  else
    *errCode = UNKNOWN_INPUT_ERR;
  return;
}

void
upcoef_content_validate (void * pvApiCtx, int *errCode, int flow, char* l1,
			 char* input3, int* l4, int* l5, int* l6)
{
  *errCode = SUCCESS;
  switch (flow) {
  case 1:
    {
      if (scalar_string_check((l1),'a') ||
	  scalar_string_check((l1),'d'))
	*errCode = SUCCESS;
      else
	*errCode = OPT_CHAR_NOT_VALID;
      wfilters_content_validate(pvApiCtx,errCode,(input3));
      if ((l4)[0]<=0)
	*errCode = POSITIVE_INTEGER_ONLY;
      break;
    }
  case 2:
    {
      if (scalar_string_check((l1),'a') ||
	  scalar_string_check((l1),'d'))
	*errCode = SUCCESS;
      else
	*errCode = OPT_CHAR_NOT_VALID;
      wfilters_content_validate(pvApiCtx,errCode,(input3));
      if ((l4)[0]<=0)
	*errCode = POSITIVE_INTEGER_ONLY;
      if ((l5)[0]<=0)
	*errCode = POSITIVE_INTEGER_ONLY;
      break;
    }
  case 3:
    {
      if (scalar_string_check((l1),'a') ||
	  scalar_string_check((l1),'d'))
	*errCode = SUCCESS;
      else
	*errCode = OPT_CHAR_NOT_VALID;
      if ((l5)[0]<=0)
	*errCode = POSITIVE_INTEGER_ONLY;
      break;
    }
  case 4:
    {
      if (scalar_string_check((l1),'a') ||
	  scalar_string_check((l1),'d'))
	*errCode = SUCCESS;
      else
	*errCode = OPT_CHAR_NOT_VALID;
      if ((l5)[0]<=0)
	*errCode = POSITIVE_INTEGER_ONLY;
      if ((l6)[0]<=0)
	*errCode = POSITIVE_INTEGER_ONLY;
      break;
    }
  case 5:
    {
      if (scalar_string_check((l1),'a') ||
	  scalar_string_check((l1),'d'))
	*errCode = SUCCESS;
      else
	*errCode = OPT_CHAR_NOT_VALID;
      wfilters_content_validate(pvApiCtx,errCode,(input3));
      break;
    }
  case 6:
    {
      if (scalar_string_check((l1),'a') ||
	  scalar_string_check((l1),'d'))
	*errCode = SUCCESS;
      else
	*errCode = OPT_CHAR_NOT_VALID;
      break;
    }
  default:
    break;
  }
  return;
}

/*-------------------------------------------
 * upwlev validation
 *-----------------------------------------*/

void
upwlev_form_validate (void * pvApiCtx, int *errCode, int *flow, int NInputArgument)
{
  *errCode = SUCCESS;
  if ((NInputArgument==3) && sci_matrix_vector_real(pvApiCtx,1) &&
      sci_matrix_vector_real(pvApiCtx,2) && sci_strings_scalar(pvApiCtx,3))
    *flow = 1;
  else if ((NInputArgument==4) && sci_matrix_vector_real(pvApiCtx,1) &&
	   sci_matrix_vector_real(pvApiCtx,2) && sci_matrix_vector_real(pvApiCtx,3) &&
	   sci_matrix_vector_real(pvApiCtx,4) && vector_length_check(pvApiCtx,3,4))
    *flow = 2;
  else
    *errCode = UNKNOWN_INPUT_ERR;
  return;
}

void
upwlev_content_validate (void * pvApiCtx, int *errCode, int flow,char* l3)
{
  *errCode = SUCCESS;
  switch (flow){
  case 1:
    {
      wfilters_content_validate(pvApiCtx,errCode,(l3));
      break;
    }
  case 2:
    {
      break;
    }
  default:
    break;
  }
  return;
}

/*-------------------------------------------
 * dwt2 validation
 *-----------------------------------------*/

void
dwt2_form_validate (void * pvApiCtx, int *errCode, int *flow, int NInputArgument)
{
  *errCode = SUCCESS;
  if ((NInputArgument==2) && sci_matrix_matrix_real(pvApiCtx,1) &&
      sci_strings_scalar(pvApiCtx,2))
    *flow = 1;
  else if ((NInputArgument==3) && sci_matrix_matrix_real(pvApiCtx,1) &&
	   sci_matrix_vector_real(pvApiCtx,2) && sci_matrix_vector_real(pvApiCtx,3) &&
	   vector_length_check(pvApiCtx,2,3))
    *flow = 2;
  else if ((NInputArgument==4) && sci_matrix_matrix_real(pvApiCtx,1) &&
	   sci_strings_scalar(pvApiCtx,2) && sci_strings_scalar(pvApiCtx,3) &&
	   sci_strings_scalar(pvApiCtx,4))
    *flow = 3;
  else if ((NInputArgument==5) && sci_matrix_matrix_real(pvApiCtx,1) &&
	   sci_matrix_vector_real(pvApiCtx,2) && sci_matrix_vector_real(pvApiCtx,3) &&
	   vector_length_check(pvApiCtx,2,3) && sci_strings_scalar(pvApiCtx,4) &&
	   sci_strings_scalar(pvApiCtx,5))
    *flow = 4;
  else
    *errCode = UNKNOWN_INPUT_ERR;
  return;
}

void
dwt2_content_validate (void * pvApiCtx, int *errCode, int flow,  char* l2,
char*  l3, char*  l4, char*  l5)
{
  int type;
  *errCode = SUCCESS;
  switch (flow){
  case 1:
    {
      wfilters_content_validate(pvApiCtx,errCode,(l2));
      break;
    }
  case 2:
    {
      break;
    }
  case 3:
    {
      wfilters_content_validate(pvApiCtx,errCode,(l2));
      if (strcmp((l3),"mode"))
	*errCode = UNKNOWN_INPUT_ERR;
      extension_check((l4),&type);
      if (!type)
	*errCode = EXTENSION_OPT_NOT_VALID;
      break;
    }
  case 4:
    {
      if (strcmp((l4),"mode"))
	*errCode = UNKNOWN_INPUT_ERR;
      extension_check((l5),&type);
      if (!type)
	*errCode = EXTENSION_OPT_NOT_VALID;
      break;
    }
  default:
    break;
  }
  return;
}

/*-------------------------------------------
 * idwt2 validation
 *-----------------------------------------*/

void
idwt2_form_validate (void * pvApiCtx, int *errCode, int *flow, int NInputArgument)
{
  if (sci_matrix_matrix_real(pvApiCtx,1) && sci_matrix_matrix_real(pvApiCtx,2) &&
      sci_matrix_matrix_real(pvApiCtx,3) && sci_matrix_matrix_real(pvApiCtx,4) &&
      matrix_length_check(pvApiCtx,1,2) && matrix_length_check(pvApiCtx,1,3) &&
      matrix_length_check(pvApiCtx,1,4))
    *errCode = SUCCESS;
  else if (sci_matrix_matrix_real(pvApiCtx,1) && sci_matrix_void(pvApiCtx,2) &&
	   sci_matrix_void(pvApiCtx,3) && sci_matrix_void(pvApiCtx,4))
    *errCode = SUCCESS;
  else if (sci_matrix_void(pvApiCtx,1) && sci_matrix_matrix_real(pvApiCtx,2) &&
	   sci_matrix_void(pvApiCtx,3) && sci_matrix_void(pvApiCtx,4))
    *errCode = SUCCESS;
  else if (sci_matrix_void(pvApiCtx,1) && sci_matrix_void(pvApiCtx,2) &&
	   sci_matrix_matrix_real(pvApiCtx,3) && sci_matrix_void(pvApiCtx,4))
    *errCode = SUCCESS;
  else if (sci_matrix_void(pvApiCtx,1) && sci_matrix_void(pvApiCtx,2) &&
	   sci_matrix_void(pvApiCtx,3) && sci_matrix_matrix_real(pvApiCtx,4))
    *errCode = SUCCESS;
  else if (sci_matrix_matrix_real(pvApiCtx,1) && sci_matrix_matrix_real(pvApiCtx,2) &&
	   sci_matrix_void(pvApiCtx,3) && sci_matrix_void(pvApiCtx,4) &&
	   matrix_length_check(pvApiCtx,1,2))
    *errCode = SUCCESS;
  else if (sci_matrix_matrix_real(pvApiCtx,1) && sci_matrix_void(pvApiCtx,2) &&
	   sci_matrix_matrix_real(pvApiCtx,3) && sci_matrix_void(pvApiCtx,4) &&
	   matrix_length_check(pvApiCtx,1,3))
    *errCode = SUCCESS;
  else if (sci_matrix_matrix_real(pvApiCtx,1) && sci_matrix_void(pvApiCtx,2) &&
	   sci_matrix_void(pvApiCtx,3) && sci_matrix_matrix_real(pvApiCtx,4) &&
	   matrix_length_check(pvApiCtx,1,4))
    *errCode = SUCCESS;
  else if (sci_matrix_void(pvApiCtx,1) && sci_matrix_matrix_real(pvApiCtx,2) &&
	   sci_matrix_matrix_real(pvApiCtx,3) && sci_matrix_void(pvApiCtx,4) &&
	   matrix_length_check(pvApiCtx,2,3))
    *errCode = SUCCESS;
  else if (sci_matrix_void(pvApiCtx,1) && sci_matrix_matrix_real(pvApiCtx,2) &&
	   sci_matrix_void(pvApiCtx,3) && sci_matrix_matrix_real(pvApiCtx,4) &&
	   matrix_length_check(pvApiCtx,2,4))
    *errCode = SUCCESS;
  else if (sci_matrix_void(pvApiCtx,1) && sci_matrix_void(pvApiCtx,2) &&
	   sci_matrix_matrix_real(pvApiCtx,3) && sci_matrix_matrix_real(pvApiCtx,4) &&
	   matrix_length_check(pvApiCtx,3,4))
    *errCode = SUCCESS;
  else if (sci_matrix_matrix_real(pvApiCtx,1) && sci_matrix_matrix_real(pvApiCtx,2) &&
	   sci_matrix_matrix_real(pvApiCtx,3) && sci_matrix_void(pvApiCtx,4) &&
	   matrix_length_check(pvApiCtx,1,2) && matrix_length_check(pvApiCtx,1,3))
    *errCode = SUCCESS;
  else if (sci_matrix_matrix_real(pvApiCtx,1) && sci_matrix_matrix_real(pvApiCtx,2) &&
	   sci_matrix_void(pvApiCtx,3) && sci_matrix_matrix_real(pvApiCtx,4) &&
	   matrix_length_check(pvApiCtx,1,2) && matrix_length_check(pvApiCtx,1,4))
    *errCode = SUCCESS;
  else if (sci_matrix_matrix_real(pvApiCtx,1) && sci_matrix_void(pvApiCtx,2) &&
	   sci_matrix_matrix_real(pvApiCtx,3) && sci_matrix_matrix_real(pvApiCtx,4) &&
	   matrix_length_check(pvApiCtx,1,3) && matrix_length_check(pvApiCtx,1,4))
    *errCode = SUCCESS;
  else if (sci_matrix_void(pvApiCtx,1) && sci_matrix_matrix_real(pvApiCtx,2) &&
	   sci_matrix_matrix_real(pvApiCtx,3) && sci_matrix_matrix_real(pvApiCtx,4) &&
	   matrix_length_check(pvApiCtx,2,3) && matrix_length_check(pvApiCtx,2,4))
    *errCode = SUCCESS;
  else
    {
      *errCode = UNKNOWN_INPUT_ERR;
      return;
    }

  if ((NInputArgument==5) && sci_strings_scalar(pvApiCtx,5))
    *flow = 1;
  else if ((NInputArgument==6) && sci_matrix_vector_real(pvApiCtx,5) &&
	   sci_matrix_vector_real(pvApiCtx,6) && vector_length_check(pvApiCtx,5,6))
    *flow = 2;
  else if ((NInputArgument==6) && sci_strings_scalar(pvApiCtx,5) &&
	   sci_matrix_vector_real(pvApiCtx,6) && length_check(pvApiCtx,6,2))
    *flow = 3;
  else if ((NInputArgument==7) && sci_matrix_vector_real(pvApiCtx,5) &&
	   sci_matrix_vector_real(pvApiCtx,6) && vector_length_check(pvApiCtx,5,6) &&
	   sci_matrix_vector_real(pvApiCtx,7) && length_check(pvApiCtx,7,2))
    *flow = 4;
  else if ((NInputArgument==7) && sci_strings_scalar(pvApiCtx,5) &&
	   sci_strings_scalar(pvApiCtx,6) && sci_strings_scalar(pvApiCtx,7))
    *flow = 5;
  else if ((NInputArgument==8) && sci_matrix_vector_real(pvApiCtx,5) &&
	   sci_matrix_vector_real(pvApiCtx,6) && vector_length_check(pvApiCtx,5,6) &&
	   sci_strings_scalar(pvApiCtx,7) && sci_strings_scalar(pvApiCtx,8))
    *flow = 6;
  else if ((NInputArgument==8) && sci_strings_scalar(pvApiCtx,5) &&
	   sci_matrix_vector_real(pvApiCtx,6) && length_check(pvApiCtx,6,2) &&
	   sci_strings_scalar(pvApiCtx,7) && sci_strings_scalar(pvApiCtx,8))
    *flow = 7;
  else if ((NInputArgument==9) && sci_matrix_vector_real(pvApiCtx,5) &&
	   sci_matrix_vector_real(pvApiCtx,6) && vector_length_check(pvApiCtx,5,6) &&
	   sci_matrix_vector_real(pvApiCtx,7) && length_check(pvApiCtx,7,2) &&
	   sci_strings_scalar(pvApiCtx,8) && sci_strings_scalar(pvApiCtx,9))
    *flow = 8;
  else
    *errCode = UNKNOWN_INPUT_ERR;

  return;
}

/*-------------------------------------------
 * idwt2 validation
 *-----------------------------------------*/

void
idwt2_content_validate (void * pvApiCtx, int *errCode, int flow,  char* l5, int* l6,char* l6_char, int* l7,char* l7_char,char* l8,char* l9)
{
  int type;
  *errCode = SUCCESS;
  switch (flow) {
  case 1:
    {
      wfilters_content_validate(pvApiCtx,errCode,(l5));
      break;
    }
  case 2:
    {
      break;
    }
  case 3:
    {
      wfilters_content_validate(pvApiCtx,errCode,(l5));
      if (((l6)[0]<=0) || ((l6)[1]<=0))
	*errCode = POSITIVE_INTEGER_ONLY;
      break;
    }
  case 4:
    {
      if (((l7)[0]<=0) || ((l7)[1]<=0))
	*errCode = POSITIVE_INTEGER_ONLY;
      break;
    }
  case 5:
    {
      wfilters_content_validate(pvApiCtx,errCode,(l5));
      if (strcmp(l6_char,"mode"))
	*errCode = UNKNOWN_INPUT_ERR;
      extension_check(l7_char,&type);
      if (!type)
	*errCode = EXTENSION_OPT_NOT_VALID;
      break;
    }
  case 6:
    {
      if (strcmp(l7_char,"mode"))
	*errCode = UNKNOWN_INPUT_ERR;
      extension_check((l8),&type);
      if (!type)
	*errCode = EXTENSION_OPT_NOT_VALID;
      break;
    }
  case 7:
    {
      wfilters_content_validate(pvApiCtx,errCode,(l5));
      if (strcmp(l7_char,"mode"))
	*errCode = UNKNOWN_INPUT_ERR;
      extension_check((l8),&type);
      if (!type)
	*errCode = EXTENSION_OPT_NOT_VALID;
      if (((l6)[0]<=0) || ((l6)[1]<=0))
	*errCode = POSITIVE_INTEGER_ONLY;
      break;
    }
  case 8:
    {
      if (strcmp(l8,"mode"))
	*errCode = UNKNOWN_INPUT_ERR;
      extension_check((l9),&type);
      if (!type)
	*errCode = EXTENSION_OPT_NOT_VALID;
      if (((l7)[0]<=0) || ((l7)[1]<=0))
	*errCode = POSITIVE_INTEGER_ONLY;
      break;
    }
  default:
    break;
  }
  return;
}

/*-------------------------------------------
 * wavedec2 validation
 *-----------------------------------------*/

void
wavedec2_form_validate (void * pvApiCtx, int *errCode, int *flow, int NInputArgument)
{
  *errCode = SUCCESS;
  if ((NInputArgument==3) && sci_matrix_matrix_real(pvApiCtx,1) &&
      sci_matrix_scalar_real(pvApiCtx,2) && sci_strings_scalar(pvApiCtx,3))
    *flow = 1;
  else if ((NInputArgument==4) && sci_matrix_matrix_real(pvApiCtx,1) &&
	   sci_matrix_scalar_real(pvApiCtx,2) && sci_matrix_vector_real(pvApiCtx,3) &&
	   sci_matrix_vector_real(pvApiCtx,4) && vector_length_check(pvApiCtx,3,4))
    *flow = 2;
  else
    *errCode = UNKNOWN_INPUT_ERR;
  return;
}

void
wavedec2_content_validate (void * pvApiCtx, int *errCode, int flow, int* l2,   char* l3)
{
  *errCode = SUCCESS;
  switch (flow){
  case 1:
    {
      if ((l2)[0]<=0)
	*errCode = POSITIVE_INTEGER_ONLY;
      wfilters_content_validate(pvApiCtx,errCode,(l3));
      break;
    }
  case 2:
    {
      if ((l2)[0]<=0)
	*errCode = POSITIVE_INTEGER_ONLY;
      break;
    }
  default:
    break;
  }
  return;
}

/*-------------------------------------------
 * waverec2 validation
 *-----------------------------------------*/

void
waverec2_form_validate (void * pvApiCtx, int *errCode, int *flow, int NInputArgument)
{
  *errCode = SUCCESS;
  if ((NInputArgument==3) && sci_matrix_vector_real(pvApiCtx,1) &&
      sci_matrix_matrix_real(pvApiCtx,2) && sci_strings_scalar(pvApiCtx,3) &&
      matrix_col_length_check(pvApiCtx,2,2))
    *flow = 1;
  else if ((NInputArgument==4) && sci_matrix_vector_real(pvApiCtx,1) &&
	   sci_matrix_matrix_real(pvApiCtx,2) && sci_matrix_vector_real(pvApiCtx,3) &&
	   sci_matrix_vector_real(pvApiCtx,4) && matrix_length_check(pvApiCtx,3,4) &&
	   matrix_col_length_check(pvApiCtx,2,2))
    *flow = 2;
  else
    *errCode = UNKNOWN_INPUT_ERR;
  return;
}

void
waverec2_content_validate (void * pvApiCtx, int *errCode, int flow, char *l3)
{
  *errCode = SUCCESS;
  switch (flow) {
  case 1:
    {
      wfilters_content_validate(pvApiCtx,errCode,(l3));
      break;
    }
  case 2:
    {
      break;
    }
  default:
    break;
  }
  return;
}

/*-------------------------------------------
 * wenergy2 validation
 *-----------------------------------------*/

void
wenergy2_form_validate (void * pvApiCtx, int *errCode, int *flow, int NInputArgument, int NOutputArgument)
{
  *errCode = SUCCESS;
  if ((NInputArgument==2) && (NOutputArgument==4) && sci_matrix_vector_real(pvApiCtx,1) &&
      sci_matrix_matrix_real(pvApiCtx,2) && matrix_col_length_check(pvApiCtx,2,2))
    *flow = 1;
  else if ((NInputArgument==2) && (NOutputArgument==2) && sci_matrix_vector_real(pvApiCtx,1) &&
	   sci_matrix_matrix_real(pvApiCtx,2) && matrix_col_length_check(pvApiCtx,2,2))
    *flow = 2;
  else
    *errCode = UNKNOWN_INPUT_ERR;
  return;
}

/*-------------------------------------------
 * detcoef2 validation
 *-----------------------------------------*/

void
detcoef2_form_validate (void * pvApiCtx, int *errCode, int *flow, int NInputArgument)
{
  if ((NInputArgument==4) && sci_strings_scalar(pvApiCtx,1) &&
      sci_matrix_vector_real(pvApiCtx,2) && sci_matrix_matrix_real(pvApiCtx,3) &&
      sci_matrix_scalar_real(pvApiCtx,4) && matrix_col_length_check(pvApiCtx,3,2))
    *errCode = SUCCESS;
  else
    *errCode = UNKNOWN_INPUT_ERR;
  return;
}


void
detcoef2_content_validate (void * pvApiCtx, int *errCode, int flow, char* l1)
{
  if ((!strcmp((l1),"a")) || (!strcmp((l1),"h")) ||
      (!strcmp((l1),"v")) || (!strcmp((l1),"d")) ||
      (!strcmp((l1),"c")) || (!strcmp((l1),"all")) ||
      (!strcmp((l1),"compact")))
    *errCode = SUCCESS;
  else
    *errCode = OPT_CHAR_NOT_VALID;
  return;
}


/*-------------------------------------------
 * appcoef2 validation
 *-----------------------------------------*/

void
appcoef2_form_validate (void * pvApiCtx, int *errCode, int *flow, int NInputArgument)
{
  *errCode = SUCCESS;
  if ((NInputArgument==3) && sci_matrix_vector_real(pvApiCtx,1) &&
      sci_matrix_matrix_real(pvApiCtx,2) && sci_strings_scalar(pvApiCtx,3) &&
      matrix_col_length_check(pvApiCtx,2,2))
    *flow = 2;
  else if ((NInputArgument==4) && sci_matrix_vector_real(pvApiCtx,1) &&
	   sci_matrix_matrix_real(pvApiCtx,2) && sci_strings_scalar(pvApiCtx,3) &&
	   sci_matrix_scalar_real(pvApiCtx,4) && matrix_col_length_check(pvApiCtx,2,2))
    *flow = 1;
  else if ((NInputArgument==4) && sci_matrix_vector_real(pvApiCtx,1) &&
	   sci_matrix_matrix_real(pvApiCtx,2) && sci_matrix_vector_real(pvApiCtx,3) &&
	   sci_matrix_vector_real(pvApiCtx,4) &&
	   matrix_col_length_check(pvApiCtx,2,2) && vector_length_check(pvApiCtx,3,4))
    *flow = 3;
  else if ((NInputArgument==5) && sci_matrix_vector_real(pvApiCtx,1) &&
	   sci_matrix_matrix_real(pvApiCtx,2) && sci_matrix_vector_real(pvApiCtx,3) &&
	   sci_matrix_vector_real(pvApiCtx,4) && sci_matrix_scalar_real(pvApiCtx,5) &&
	   vector_length_check(pvApiCtx,3,4) && matrix_col_length_check(pvApiCtx,2,2))
    *flow = 4;
  else
    *errCode = UNKNOWN_INPUT_ERR;
  return;
}


void
appcoef2_content_validate (void * pvApiCtx, int *errCode, int flow, char* l3, int* l4, int* l5)
{
  *errCode = SUCCESS;
  switch (flow) {
  case 1:
    {
      wfilters_content_validate(pvApiCtx,errCode,(l3));
      if ((l4)[0]<0)
	*errCode = POSITIVE_INTEGER_ONLY;
      break;
    }
  case 2:
    {
      wfilters_content_validate(pvApiCtx,errCode,(l3));
      break;
    }
  case 3:
    {
      break;
    }
  case 4:
    {
      if ((l5)[0]<0)
	*errCode = POSITIVE_INTEGER_ONLY;
      break;
    }
  default:
    break;
  }
  return;
}


/*-------------------------------------------
 * wrcoef2 validation
 *-----------------------------------------*/

void
wrcoef2_form_validate (void * pvApiCtx, int *errCode, int *flow, int NInputArgument)
{
  *errCode = SUCCESS;
  if ((NInputArgument==4) && sci_strings_scalar(pvApiCtx,1) &&
      sci_matrix_vector_real(pvApiCtx,2) && sci_matrix_matrix_real(pvApiCtx,3) &&
      sci_strings_scalar(pvApiCtx,4) && matrix_col_length_check(pvApiCtx,3,2))
    *flow = 3;
  else if ((NInputArgument==5) && sci_strings_scalar(pvApiCtx,1) &&
	   sci_matrix_vector_real(pvApiCtx,2) && sci_matrix_matrix_real(pvApiCtx,3) &&
	   sci_strings_scalar(pvApiCtx,4) && sci_matrix_scalar_real(pvApiCtx,5) &&
	   matrix_col_length_check(pvApiCtx,3,2))
    *flow = 1;
  else if ((NInputArgument==5) && sci_strings_scalar(pvApiCtx,1) &&
	   sci_matrix_vector_real(pvApiCtx,2) && sci_matrix_matrix_real(pvApiCtx,3) &&
	   sci_matrix_vector_real(pvApiCtx,4) && sci_matrix_vector_real(pvApiCtx,5) &&
	   vector_length_check(pvApiCtx,4,5) && matrix_col_length_check(pvApiCtx,3,2))
    *flow = 4;
  else if ((NInputArgument==6) && sci_strings_scalar(pvApiCtx,1) &&
	   sci_matrix_vector_real(pvApiCtx,2) && sci_matrix_matrix_real(pvApiCtx,3) &&
	   sci_matrix_vector_real(pvApiCtx,4) && sci_matrix_vector_real(pvApiCtx,5) &&
	   vector_length_check(pvApiCtx,4,5) &&
	   matrix_col_length_check(pvApiCtx,3,2) && sci_matrix_scalar_real(pvApiCtx,6))
    *flow = 2;
  return;
}

void
wrcoef2_content_validate (void * pvApiCtx, int *errCode, int flow, char* l1,  char* l4, int* l5, int* l6)
{
  if (scalar_string_check((l1),'a') ||
      scalar_string_check((l1),'h') ||
      scalar_string_check((l1),'v') ||
      scalar_string_check((l1),'d'))
    *errCode = SUCCESS;
  else
    {
      *errCode = OPT_CHAR_NOT_VALID;
      return;
    }
  switch (flow) {
  case 1:
    {
      wfilters_content_validate(pvApiCtx,errCode,(l4));
      if ((l5)[0]<=0)
	*errCode = POSITIVE_INTEGER_ONLY;
      if (scalar_string_check((l1),'a') ||
	  scalar_string_check((l1),'h') ||
	  scalar_string_check((l1),'v') ||
	  scalar_string_check((l1),'d'))
	*errCode = SUCCESS;
      else
	*errCode = OPT_CHAR_NOT_VALID;
      break;
    }
  case 2:
    {
      if ((l6)[0]<=0)
	*errCode = POSITIVE_INTEGER_ONLY;
      break;
    }
  case 3:
    {
      wfilters_content_validate(pvApiCtx,errCode,(l4));
      break;
    }
  case 4:
    {
      break;
    }
  default:
    break;
  }
  return;
}

/*-------------------------------------------
 * upwlev2 validation
 *-----------------------------------------*/

void
upwlev2_form_validate (void * pvApiCtx, int *errCode, int *flow, int NInputArgument)
{
  *errCode = SUCCESS;
  if ((NInputArgument==3) && sci_matrix_vector_real(pvApiCtx,1) &&
      sci_matrix_matrix_real(pvApiCtx,2) && sci_strings_scalar(pvApiCtx,3) &&
      matrix_col_length_check(pvApiCtx,2,2))
    *flow = 1;
  else if ((NInputArgument==4) && sci_matrix_vector_real(pvApiCtx,1) &&
	   sci_matrix_matrix_real(pvApiCtx,2) && sci_matrix_vector_real(pvApiCtx,3) &&
	   sci_matrix_vector_real(pvApiCtx,4) && vector_length_check(pvApiCtx,3,4) &&
	   matrix_col_length_check(pvApiCtx,2,2))
    *flow = 2;
  else
    *errCode = UNKNOWN_INPUT_ERR;
  return;
}

void
upwlev2_content_validate (void * pvApiCtx, int *errCode, int flow, char *l3)
{
  *errCode = SUCCESS;
  switch (flow) {
  case 1:
    {
      wfilters_content_validate(pvApiCtx,errCode,(l3));
      break;
    }
  case 2:
    {
      break;
    }
  default:
    break;
  }
  return;
}

/*-------------------------------------------
 * upcoef2 validation
 *-----------------------------------------*/

void
upcoef2_form_validate (void * pvApiCtx, int *errCode, int *flow, int NInputArgument)
{
  *errCode = SUCCESS;
  if ((NInputArgument==3) && sci_strings_scalar(pvApiCtx,1) &&
      (sci_matrix_matrix_real(pvApiCtx,2) || sci_matrix_scalar_real(pvApiCtx,2) || sci_matrix_vector_real(pvApiCtx,2)) && sci_strings_scalar(pvApiCtx,3))
    *flow = 5;
  else if ((NInputArgument==4) && sci_strings_scalar(pvApiCtx,1) &&
	   (sci_matrix_matrix_real(pvApiCtx,2) || sci_matrix_scalar_real(pvApiCtx,2)) && sci_strings_scalar(pvApiCtx,3) &&
	   sci_matrix_scalar_real(pvApiCtx,4))
    *flow = 3;
  else if ((NInputArgument==4) && sci_strings_scalar(pvApiCtx,1) &&
	   (sci_matrix_matrix_real(pvApiCtx,2) || sci_matrix_scalar_real(pvApiCtx,2)) && sci_matrix_vector_real(pvApiCtx,3) &&
	   sci_matrix_vector_real(pvApiCtx,4) && vector_length_check(pvApiCtx,3,4))
    *flow = 6;
  else if ((NInputArgument==5) && sci_strings_scalar(pvApiCtx,1) &&
	   (sci_matrix_matrix_real(pvApiCtx,2) || sci_matrix_scalar_real(pvApiCtx,2)) && sci_strings_scalar(pvApiCtx,3) &&
	   sci_matrix_scalar_real(pvApiCtx,4) && sci_matrix_vector_real(pvApiCtx,5) &&
	   length_check(pvApiCtx,5,2))
    *flow = 1;
  else if ((NInputArgument==5) && sci_strings_scalar(pvApiCtx,1) &&
	   (sci_matrix_matrix_real(pvApiCtx,2) || sci_matrix_scalar_real(pvApiCtx,2)) && sci_matrix_vector_real(pvApiCtx,3) &&
	   sci_matrix_vector_real(pvApiCtx,4) && vector_length_check(pvApiCtx,3,4) &&
	   sci_matrix_scalar_real(pvApiCtx,5))
    *flow = 4;
  else if ((NInputArgument==6) && sci_strings_scalar(pvApiCtx,1) &&
	   (sci_matrix_matrix_real(pvApiCtx,2) || sci_matrix_scalar_real(pvApiCtx,2)) && sci_matrix_vector_real(pvApiCtx,3) &&
	   sci_matrix_vector_real(pvApiCtx,4) && vector_length_check(pvApiCtx,3,4) &&
	   sci_matrix_scalar_real(pvApiCtx,5) && sci_matrix_vector_real(pvApiCtx,6) &&
	   length_check(pvApiCtx,6,2))
    *flow = 2;
  else
    *errCode = UNKNOWN_INPUT_ERR;
  return;
}

void
upcoef2_content_validate (void * pvApiCtx, int *errCode, int flow, char* l1,  char* l3, int* l4, int* l5, int* l6)
{
  if ((!strcmp((l1),"a")) || (!strcmp((l1),"h")) ||
      (!strcmp((l1),"v")) || (!strcmp((l1),"d")))
    *errCode = SUCCESS;
  else
    {
      *errCode = OPT_CHAR_NOT_VALID;
      return;
    }
  switch (flow) {
  case 1:
    {
      wfilters_content_validate(pvApiCtx,errCode,(l3));
      if (((l4)[0]<=0) || ((l5)[0]<=0) ||
	  ((l5)[1]<=0))
	*errCode = POSITIVE_INTEGER_ONLY;
      break;
    }
  case 2:
    {
      if (((l5)[0]<=0) || ((l6)[0]<=0) ||
	  ((l6)[1]<=0))
	*errCode = POSITIVE_INTEGER_ONLY;
      break;
    }
  case 3:
    {
      wfilters_content_validate(pvApiCtx,errCode,(l3));
      if ((l4)[0]<=0)
	*errCode = POSITIVE_INTEGER_ONLY;
      break;
    }
  case 4:
    {
      if ((l5)[0]<=0)
	*errCode = POSITIVE_INTEGER_ONLY;
      break;
    }
  case 5:
    {
      wfilters_content_validate(pvApiCtx,errCode,(l3));
      break;
    }
  case 6:
    {
      break;
    }
  default:
    break;
  }
  return;
}

/*-------------------------------------------
 * dwt3 validation
 *-----------------------------------------*/
void
dwt3_form_validate (void * pvApiCtx, int *errCode, int *flow, int NInputArgument)
{
  *errCode = SUCCESS;
  if ((NInputArgument==2) && sci_mlist_check(pvApiCtx,1) &&
      sci_strings_scalar(pvApiCtx,2))
    *flow = 1;
  else if ((NInputArgument==3) && sci_mlist_check(pvApiCtx,1) &&
	   sci_matrix_vector_real(pvApiCtx,2) &&
	   sci_matrix_vector_real(pvApiCtx,3) &&
	   vector_length_check(pvApiCtx,2,3))
    *flow = 2;
  else if ((NInputArgument==4) && sci_mlist_check(pvApiCtx,1) &&
	   sci_strings_scalar(pvApiCtx,2) &&
	   sci_strings_scalar(pvApiCtx,3) &&
	   sci_strings_scalar(pvApiCtx,4))
    *flow = 3;
  else if ((NInputArgument==5) && sci_mlist_check(pvApiCtx,1) &&
	   sci_matrix_vector_real(pvApiCtx,2) &&
           sci_matrix_vector_real(pvApiCtx,3) &&
	   vector_length_check(pvApiCtx,2,3) &&
	   sci_strings_scalar(pvApiCtx,4) &&
	   sci_strings_scalar(pvApiCtx,5))
    *flow = 4;
  else if ((NInputArgument==4) && sci_mlist_check(pvApiCtx,1) &&
	   sci_strings_scalar(pvApiCtx,2) &&
	   sci_strings_scalar(pvApiCtx,3) &&
	   sci_strings_scalar(pvApiCtx,4))
    *flow = 5;
  else if ((NInputArgument==7) && sci_mlist_check(pvApiCtx,1) &&
	   sci_matrix_vector_real(pvApiCtx,2) &&
	   sci_matrix_vector_real(pvApiCtx,3) &&
	   sci_matrix_vector_real(pvApiCtx,4) &&
	   sci_matrix_vector_real(pvApiCtx,5) &&
	   sci_matrix_vector_real(pvApiCtx,6) &&
	   sci_matrix_vector_real(pvApiCtx,7) &&
	   vector_length_check(pvApiCtx,2,3) &&
	   vector_length_check(pvApiCtx,4,5) &&
	   vector_length_check(pvApiCtx,6,7))
    *flow = 6;
  else if ((NInputArgument==6) && sci_mlist_check(pvApiCtx,1) &&
	   sci_strings_scalar(pvApiCtx,2) &&
	   sci_strings_scalar(pvApiCtx,3) &&
	   sci_strings_scalar(pvApiCtx,4) &&
	   sci_strings_scalar(pvApiCtx,5) &&
	   sci_strings_scalar(pvApiCtx,6) )
    *flow = 7;
  else if ((NInputArgument==9) && sci_mlist_check(pvApiCtx,1) &&
	   sci_matrix_vector_real(pvApiCtx,2) &&
	   sci_matrix_vector_real(pvApiCtx,3) &&
	   sci_matrix_vector_real(pvApiCtx,4) &&
	   sci_matrix_vector_real(pvApiCtx,5) &&
	   sci_matrix_vector_real(pvApiCtx,6) &&
	   sci_matrix_vector_real(pvApiCtx,7) &&
	   vector_length_check(pvApiCtx,2,3) &&
	   vector_length_check(pvApiCtx,4,5) &&
	   vector_length_check(pvApiCtx,6,7) &&
	   sci_strings_scalar(pvApiCtx,8) &&
	   sci_strings_scalar(pvApiCtx,9) )
    *flow = 8;
  else
    *errCode = UNKNOWN_INPUT_ERR;
  return;
}

void
dwt3_content_validate (void * pvApiCtx, int *errCode, int flow, char* l2,  char* l3, char* l4, char* l5, char* l6,      char* l8, char* l9)
{
  int type, err1, err2, err3;
  *errCode = SUCCESS;
  switch (flow){
  case 1:
    {
      wfilters_content_validate(pvApiCtx,errCode,(l2));
      break;
    }
  case 2:
    {
      break;
    }
  case 3:
    {
      wfilters_content_validate(pvApiCtx,errCode,(l2));
      if (strcmp((l3),"mode"))
	*errCode = UNKNOWN_INPUT_ERR;
      extension_check((l4),&type);
      if (!type)
	*errCode = EXTENSION_OPT_NOT_VALID;
      break;
    }
  case 4:
    {
      if (strcmp((l4),"mode"))
	*errCode = UNKNOWN_INPUT_ERR;
      extension_check((l5),&type);
      if (!type)
	*errCode = EXTENSION_OPT_NOT_VALID;
      break;
    }
  case 5:
    {
      wfilters_content_validate(pvApiCtx,&err1,(l2));
      wfilters_content_validate(pvApiCtx,&err2,(l3));
      wfilters_content_validate(pvApiCtx,&err3,(l4));
      if ((err1 != SUCCESS) || (err1 != SUCCESS) ||
	  (err1 != SUCCESS))
	*errCode = WAVELET_NAME_NOT_VALID;
      break;
    }
  case 6:
    {

      break;
    }
  case 7:
    {
      wfilters_content_validate(pvApiCtx,&err1,(l2));
      wfilters_content_validate(pvApiCtx,&err2,(l3));
      wfilters_content_validate(pvApiCtx,&err3,(l4));
      if ((err1 != SUCCESS) || (err1 != SUCCESS) ||
	  (err1 != SUCCESS))
	*errCode = WAVELET_NAME_NOT_VALID;
      if (strcmp((l5),"mode"))
	*errCode = UNKNOWN_INPUT_ERR;
      extension_check((l6),&type);
      if (!type)
	*errCode = EXTENSION_OPT_NOT_VALID;
      break;
    }
  case 8:
    {
      if (strcmp((l8),"mode"))
	*errCode = UNKNOWN_INPUT_ERR;
      extension_check((l9),&type);
      if (!type)
	*errCode = EXTENSION_OPT_NOT_VALID;
      break;
    }
  default:
    break;
  }
  return;
}


/*-------------------------------------------
 * idwt3 validation
 *-----------------------------------------*/
void
idwt3_form_validate (void * pvApiCtx, int *errCode, int *flow, int NInputArgument)
{
  *errCode = SUCCESS;
  if ((NInputArgument==2) && sci_mlist_check(pvApiCtx,1) &&
      sci_strings_scalar(pvApiCtx,2))
    *flow = 1;
  else if ((NInputArgument==3) && sci_mlist_check(pvApiCtx,1) &&
	   sci_strings_scalar(pvApiCtx,2) &&
	   sci_matrix_vector_real(pvApiCtx,3) &&
	   length_check(pvApiCtx,3,3))
    *flow = 2;
  else if ((NInputArgument==3) && sci_mlist_check(pvApiCtx,1) &&
	   sci_matrix_vector_real(pvApiCtx,2) &&
	   sci_matrix_vector_real(pvApiCtx,3) &&
	   vector_length_check(pvApiCtx,2,3))
    *flow = 3;
  else if ((NInputArgument==4) && sci_mlist_check(pvApiCtx,1) &&
	   sci_matrix_vector_real(pvApiCtx,2) &&
           sci_matrix_vector_real(pvApiCtx,3) &&
	   vector_length_check(pvApiCtx,2,3) &&
	   sci_matrix_vector_real(pvApiCtx,4) &&
	   length_check(pvApiCtx,4,3))
    *flow = 4;
  else if ((NInputArgument==4) && sci_mlist_check(pvApiCtx,1) &&
	   sci_strings_scalar(pvApiCtx,2) &&
	   sci_strings_scalar(pvApiCtx,3) &&
	   sci_strings_scalar(pvApiCtx,4))
    *flow = 5;
  else if ((NInputArgument==5) && sci_mlist_check(pvApiCtx,1) &&
	   sci_strings_scalar(pvApiCtx,2) &&
	   sci_strings_scalar(pvApiCtx,3) &&
	   sci_strings_scalar(pvApiCtx,4) &&
	   sci_matrix_vector_real(pvApiCtx,5) &&
	   length_check(pvApiCtx,5,3))
    *flow = 6;
  else if ((NInputArgument==7) && sci_mlist_check(pvApiCtx,1) &&
	   sci_matrix_vector_real(pvApiCtx,2) &&
	   sci_matrix_vector_real(pvApiCtx,3) &&
	   sci_matrix_vector_real(pvApiCtx,4) &&
	   sci_matrix_vector_real(pvApiCtx,5) &&
	   sci_matrix_vector_real(pvApiCtx,6) &&
	   sci_matrix_vector_real(pvApiCtx,7) &&
	   vector_length_check(pvApiCtx,2,3) &&
	   vector_length_check(pvApiCtx,4,5) &&
	   vector_length_check(pvApiCtx,6,7))
    *flow = 7;
  else if ((NInputArgument==8) && sci_mlist_check(pvApiCtx,1) &&
	   sci_matrix_vector_real(pvApiCtx,2) &&
	   sci_matrix_vector_real(pvApiCtx,3) &&
	   sci_matrix_vector_real(pvApiCtx,4) &&
	   sci_matrix_vector_real(pvApiCtx,5) &&
	   sci_matrix_vector_real(pvApiCtx,6) &&
	   sci_matrix_vector_real(pvApiCtx,7) &&
	   vector_length_check(pvApiCtx,2,3) &&
	   vector_length_check(pvApiCtx,4,5) &&
	   vector_length_check(pvApiCtx,6,7) &&
	   sci_matrix_vector_real(pvApiCtx,8) &&
	   length_check(pvApiCtx,8,3))
    *flow = 8;
  else
    *errCode = UNKNOWN_INPUT_ERR;
  return;
}

void
idwt3_content_validate (void * pvApiCtx, int *errCode, int flow,
			char* l2,	char* char_l3,int* l3, char* char_l4,int* l4, int* l5,
			int* l8)
{
  int type, err1, err2, err3;
  *errCode = SUCCESS;
  switch (flow){
  case 1:
    {
      wfilters_content_validate(pvApiCtx,errCode,(l2));
      break;
    }
  case 2:
    {
      wfilters_content_validate(pvApiCtx,errCode,(l2));
      if (((l3)[0]<=0) || ((l3)[1]<=0) || ((l3)[2]<=0))
	{
	  *errCode = UNKNOWN_INPUT_ERR;
	}
      break;
    }
  case 3:
    {
      break;
    }
  case 4:
    {
      if (((l4)[0]<=0) || ((l4)[1]<=0) || ((l4)[2]<=0))
	{
	  *errCode = UNKNOWN_INPUT_ERR;
	}
      break;
    }
  case 5:
    {
      wfilters_content_validate(pvApiCtx,&err1,(l2));
      wfilters_content_validate(pvApiCtx,&err2,char_l3);
      wfilters_content_validate(pvApiCtx,&err3,char_l4);
      if ((err1 != SUCCESS) || (err1 != SUCCESS) ||
	  (err1 != SUCCESS))
	*errCode = WAVELET_NAME_NOT_VALID;
      break;
    }
  case 6:
    {
      wfilters_content_validate(pvApiCtx,&err1,(l2));
      wfilters_content_validate(pvApiCtx,&err2,char_l3);
      wfilters_content_validate(pvApiCtx,&err3,char_l4);
      if ((err1 != SUCCESS) || (err1 != SUCCESS) ||
	  (err1 != SUCCESS))
	*errCode = WAVELET_NAME_NOT_VALID;
      if (((l5)[0]<=0) || ((l5)[1]<=0) || ((l5)[2]<=0))
	{
	  *errCode = UNKNOWN_INPUT_ERR;
	}
      break;
    }
  case 7:
    {
      break;
    }
  case 8:
    {
      if (((l8)[0]<=0) || ((l8)[1]<=0) || ((l8)[2]<=0))
	{
	  *errCode = UNKNOWN_INPUT_ERR;
	}
      break;
    }
  default:
    break;
  }
  return;
}
