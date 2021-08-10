/*
 * -------------------------------------------------------------------------
 * swt_validate.c -- SWT validation
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
 #include "Scierror.h"
 //#include "localization.h"
 //#include "warningmode.h"
 #include "sciprint.h"

 /*-------------------------------------------
 * swt validation
 *-----------------------------------------*/

 void
 swt_form_validate (void * pvApiCtx, int *errCode, int *flow, int NInputArgument, int NOutputArgument)
 {
   *errCode = SUCCESS;
   if ((NOutputArgument==1) && (NInputArgument==3) && (sci_matrix_vector_real(pvApiCtx,1)) &&
	   sci_matrix_scalar_real(pvApiCtx,2) && sci_strings_scalar(pvApiCtx,3))
	   *flow = 1;
   else if ((NOutputArgument==1) && (NInputArgument==4) && (sci_matrix_vector_real(pvApiCtx,1)) &&
	   sci_matrix_scalar_real(pvApiCtx,2) && (sci_matrix_vector_real(pvApiCtx,3)) &&
	   (sci_matrix_vector_real(pvApiCtx,4)) && vector_length_check(pvApiCtx,3,4))
	   *flow = 2;
   else if ((NOutputArgument==2) && (NInputArgument==3) && (sci_matrix_vector_real(pvApiCtx,1)) &&
	   sci_matrix_scalar_real(pvApiCtx,2) && sci_strings_scalar(pvApiCtx,3))
	   *flow = 3;
   else if ((NOutputArgument==2) && (NInputArgument==4) && (sci_matrix_vector_real(pvApiCtx,1)) &&
	   sci_matrix_scalar_real(pvApiCtx,2) && (sci_matrix_vector_real(pvApiCtx,3)) &&
	   (sci_matrix_vector_real(pvApiCtx,4)) && vector_length_check(pvApiCtx,3,4))
	   *flow = 4;
   else
	   *errCode = UNKNOWN_INPUT_ERR;
   return;
 }

 void
 swt_content_validate (void * pvApiCtx, int *errCode, int flow,  int* l2, char* l3)
 {
   *errCode = SUCCESS;
   switch (flow) {
   case 1:
    {
      wfilters_content_validate(pvApiCtx,errCode,(l3));
      if ((l2)[0]<=0)
	     *errCode = POSITIVE_INTEGER_ONLY;
      break;
    }
   case 2:
    {
      break;
    }
   case 3:
    {
	  wfilters_content_validate(pvApiCtx,errCode,(l3));
      if ((l2)[0]<=0)
	     *errCode = POSITIVE_INTEGER_ONLY;
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
  * iswt validation
  *-----------------------------------------*/

  void iswt_form_validate (void * pvApiCtx, int *errCode, int *flow, int NInputArgument)
  {
    *errCode = SUCCESS;
	if ((NInputArgument==2) && (sci_matrix_matrix_real(pvApiCtx,1)) &&
		sci_strings_scalar(pvApiCtx,2))
		*flow = 1;
	else if ((NInputArgument==3) && sci_strings_scalar(pvApiCtx,3) &&
		  (( sci_matrix_matrix_real(pvApiCtx,1) && sci_matrix_matrix_real(pvApiCtx,2) && matrix_length_check(pvApiCtx,1,2) ) ||
          ( sci_matrix_vector_real(pvApiCtx,1) && sci_matrix_vector_real(pvApiCtx,2) && vector_length_check(pvApiCtx,1,2) )))
		*flow = 2;
	else if ( (NInputArgument==3) && (sci_matrix_matrix_real(pvApiCtx,1)) &&
		(sci_matrix_vector_real(pvApiCtx,2)) && (sci_matrix_vector_real(pvApiCtx,3)) &&
		vector_length_check(pvApiCtx,2,3))
		*flow = 3;
	else if ((NInputArgument==4) &&
		(sci_matrix_vector_real(pvApiCtx,3)) && (sci_matrix_vector_real(pvApiCtx,4)) &&
		vector_length_check(pvApiCtx,3,4) &&
		((sci_matrix_matrix_real(pvApiCtx,1) && sci_matrix_matrix_real(pvApiCtx,2) && matrix_length_check(pvApiCtx,1,2) )||
		(sci_matrix_vector_real(pvApiCtx,1) && sci_matrix_vector_real(pvApiCtx,2) && vector_length_check(pvApiCtx,1,2) )))
		*flow = 4;
   	else
		*errCode = UNKNOWN_INPUT_ERR;
    return;
  }

  void iswt_content_validate (void * pvApiCtx, int *errCode, int flow, char* l2, char* l3)
  {
    *errCode = SUCCESS;
    switch (flow) {
    case 1:
     {
       wfilters_content_validate(pvApiCtx,errCode,(l2));
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
       break;
     }
   default:
     break;
   }
    return;
  }

  /*-------------------------------------------
 * swt2 validation
 *-----------------------------------------*/

 void
 swt2_form_validate (void * pvApiCtx, int *errCode, int *flow, int NInputArgument, int NOutputArgument)
 {
   *errCode = SUCCESS;
   if ((NOutputArgument==1) && (NInputArgument==3) && (sci_matrix_matrix_real(pvApiCtx,1)) &&
	   sci_matrix_scalar_real(pvApiCtx,2) && sci_strings_scalar(pvApiCtx,3))
	   *flow = 1;
   else if ((NOutputArgument==1) && (NInputArgument==4) && (sci_matrix_matrix_real(pvApiCtx,1)) &&
	   sci_matrix_scalar_real(pvApiCtx,2) && (sci_matrix_vector_real(pvApiCtx,3)) &&
	   (sci_matrix_vector_real(pvApiCtx,3)) && vector_length_check(pvApiCtx,3,4))
	   *flow = 2;
   else if ((NOutputArgument==4) && (NInputArgument==3) && (sci_matrix_matrix_real(pvApiCtx,1)) &&
	   sci_matrix_scalar_real(pvApiCtx,2) && sci_strings_scalar(pvApiCtx,3))
	   *flow = 3;
   else if ((NOutputArgument==4) && (NInputArgument==4) && (sci_matrix_matrix_real(pvApiCtx,1)) &&
	   sci_matrix_scalar_real(pvApiCtx,2) && (sci_matrix_vector_real(pvApiCtx,3)) &&
	   (sci_matrix_vector_real(pvApiCtx,4)) && vector_length_check(pvApiCtx,3,4))
	   *flow = 4;
   else
	   *errCode = UNKNOWN_INPUT_ERR;
   return;
 }

 void
 swt2_content_validate (void * pvApiCtx, int *errCode, int flow, int* l2, char* l3)
 {
   *errCode = SUCCESS;
   switch (flow) {
   case 1:
    {
      wfilters_content_validate(pvApiCtx,errCode,(l3));
      if ((l2)[0]<=0)
	     *errCode = POSITIVE_INTEGER_ONLY;
      break;
    }
   case 2:
    {
      break;
    }
   case 3:
    {
	  wfilters_content_validate(pvApiCtx,errCode,(l3));
      if ((l2)[0]<=0)
	     *errCode = POSITIVE_INTEGER_ONLY;
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
  * iswt2 validation
  *-----------------------------------------*/

  void iswt2_form_validate (void * pvApiCtx, int *errCode, int *flow, int NInputArgument)
  {
    *errCode = SUCCESS;
	if ((NInputArgument==2) && (sci_mlist_check(pvApiCtx,1)) &&
		sci_strings_scalar(pvApiCtx,2))
		*flow = 1;
	else if ((NInputArgument==3) && (sci_mlist_check(pvApiCtx,1)) &&
		  sci_matrix_vector_real(pvApiCtx,2) &&
		  sci_matrix_vector_real(pvApiCtx,3) && vector_length_check(pvApiCtx,2,3) )
		*flow = 2;
	else if ( (NInputArgument==5) &&
		((sci_mlist_check(pvApiCtx,1) && sci_mlist_check(pvApiCtx,2) && sci_mlist_check(pvApiCtx,3) && sci_mlist_check(pvApiCtx,4)) ||
		(sci_matrix_matrix_real(pvApiCtx,1) && sci_matrix_matrix_real(pvApiCtx,2) && sci_matrix_matrix_real(pvApiCtx,3) &&
		sci_matrix_matrix_real(pvApiCtx,4) && matrix_length_check(pvApiCtx,1,2) && matrix_length_check(pvApiCtx,2,3) &&
		matrix_length_check(pvApiCtx,3,4))) &&
		sci_strings_scalar(pvApiCtx,5))
		*flow = 3;
	else if ((NInputArgument==6) &&
		((sci_mlist_check(pvApiCtx,1) && sci_mlist_check(pvApiCtx,2) && sci_mlist_check(pvApiCtx,3) && sci_mlist_check(pvApiCtx,4)) ||
		(sci_matrix_matrix_real(pvApiCtx,1) && sci_matrix_matrix_real(pvApiCtx,2) && sci_matrix_matrix_real(pvApiCtx,3) &&
		sci_matrix_matrix_real(pvApiCtx,4) && matrix_length_check(pvApiCtx,1,2) && matrix_length_check(pvApiCtx,2,3) &&
		matrix_length_check(pvApiCtx,3,4))) &&
		(sci_matrix_vector_real(pvApiCtx,5)) && (sci_matrix_vector_real(pvApiCtx,6)) &&
		vector_length_check(pvApiCtx,5,6) )
		*flow = 4;
   	else
		*errCode = UNKNOWN_INPUT_ERR;
    return;
  }

  void
 iswt2_content_validate (void * pvApiCtx, int *errCode, int flow, char* l2, char* l5)
 {
   *errCode = SUCCESS;
   switch (flow) {
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
	  wfilters_content_validate(pvApiCtx,errCode,(l5));

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
