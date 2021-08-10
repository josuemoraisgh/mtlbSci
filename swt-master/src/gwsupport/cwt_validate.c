/*
 * -------------------------------------------------------------------------
 * cwt_validate.c -- CWT validation
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
 * Haar
 *-----------------------------------------*/

/*void haar_form_validate(void * pvApiCtx, int *errCode)
{
    if (sci_matrix_scalar_real(pvApiCtx,1) && sci_matrix_scalar_real(pvApiCtx,2) && sci_matrix_scalar_real(pvApiCtx,3))
		*errCode = SUCCESS;
	else
		*errCode = UNKNOWN_INPUT_ERR;
	return;
}

void haar_content_validate(void * pvApiCtx, int *errCode, int l1, int l2, int l3)
{
    *errCode = SUCCESS;
	if ((stk(l1)[0]>=stk(l2)[0]) || (istk(l3)[0]<2))
		*errCode = UNKNOWN_INPUT_ERR;
	return;
}*/

/*-------------------------------------------
 * Sinus
 *-----------------------------------------*/

void sinus_form_validate(void * pvApiCtx, int *errCode)
{
    if (sci_matrix_scalar_real(pvApiCtx,1) && sci_matrix_scalar_real(pvApiCtx,2) && sci_matrix_scalar_real(pvApiCtx,3))
		*errCode = SUCCESS;
	else
		*errCode = UNKNOWN_INPUT_ERR;
	return;
}

void sinus_content_validate(void * pvApiCtx, int *errCode, double* input1, double* input2, int* input3)
{
    *errCode = SUCCESS;
	if ((input1[0]>=input2[0]) || (input3[0]<2))
		*errCode = UNKNOWN_INPUT_ERR;
	return;
}

/*-------------------------------------------
 * Poisson
 *-----------------------------------------*/

void poisson_form_validate(void * pvApiCtx, int *errCode)
{
    if (sci_matrix_scalar_real(pvApiCtx,1) && sci_matrix_scalar_real(pvApiCtx,2) && sci_matrix_scalar_real(pvApiCtx,3))
		*errCode = SUCCESS;
	else
		*errCode = UNKNOWN_INPUT_ERR;
	return;
}

void poisson_content_validate(void * pvApiCtx, int *errCode, double* input1, double* input2, int* input3)
{
    *errCode = SUCCESS;
	if ((input1[0]>=input2[0]) || (input3[0]<2))
		*errCode = UNKNOWN_INPUT_ERR;
	return;
}

/*-------------------------------------------
 * Mexican Hat
 *-----------------------------------------*/

void mexihat_form_validate(void * pvApiCtx, int *errCode)
{
    if (sci_matrix_scalar_real(pvApiCtx,1) && sci_matrix_scalar_real(pvApiCtx,2) && sci_matrix_scalar_real(pvApiCtx,3))
		*errCode = SUCCESS;
	else
		*errCode = UNKNOWN_INPUT_ERR;
	return;
}

void mexihat_content_validate(void * pvApiCtx, int *errCode, double* input1, double* input2, int* input3)
{
    *errCode = SUCCESS;
	if ((input1[0]>=input2[0]) || (input3[0]<2))
		*errCode = UNKNOWN_INPUT_ERR;
	return;
}

/*-------------------------------------------
 * Morlet
 *-----------------------------------------*/

void morlet_form_validate(void * pvApiCtx, int *errCode)
{
    if (sci_matrix_scalar_real(pvApiCtx,1) && sci_matrix_scalar_real(pvApiCtx,2) && sci_matrix_scalar_real(pvApiCtx,3))
		*errCode = SUCCESS;
	else
		*errCode = UNKNOWN_INPUT_ERR;
	return;
}

void morlet_content_validate(void * pvApiCtx, int *errCode, double* input1, double* input2, int* input3)
{
    *errCode = SUCCESS;
	if ((input1[0]>=input2[0]) || (input3[0]<2))
		*errCode = UNKNOWN_INPUT_ERR;
	return;
}

/*-------------------------------------------
 * DOG
 *-----------------------------------------*/

void DOGauss_form_validate(void * pvApiCtx, int *errCode)
{
    if (sci_matrix_scalar_real(pvApiCtx,1) && sci_matrix_scalar_real(pvApiCtx,2) && sci_matrix_scalar_real(pvApiCtx,3))
		*errCode = SUCCESS;
	else
		*errCode = UNKNOWN_INPUT_ERR;
	return;
}

void DOGauss_content_validate(void * pvApiCtx, int *errCode, double* input1, double* input2, int* input3)
{
    *errCode = SUCCESS;
	if ((input1[0]>=input2[0]) || (input3[0]<2))
		*errCode = UNKNOWN_INPUT_ERR;
	return;
}

/*-------------------------------------------
 * Gauss
 *-----------------------------------------*/

void Gauss_form_validate(void * pvApiCtx, int *errCode)
{
    if (sci_matrix_scalar_real(pvApiCtx,1) && sci_matrix_scalar_real(pvApiCtx,2) && sci_matrix_scalar_real(pvApiCtx,3) && sci_matrix_scalar_real(pvApiCtx,4))
		*errCode = SUCCESS;
	else
		*errCode = UNKNOWN_INPUT_ERR;
	return;
}

void Gauss_content_validate(void * pvApiCtx, int *errCode, double* input1, double* input2, int* input3, int* input4)
{
    *errCode = SUCCESS;
	if ((input1[0]>=input2[0]) || (input3[0]<2) || (input4[0]>8))
		*errCode = UNKNOWN_INPUT_ERR;
	return;
}



/*-------------------------------------------
 * Complex Morlet
 *-----------------------------------------*/

void cmorlet_form_validate(void * pvApiCtx, int *errCode)
{
    if (sci_matrix_scalar_real(pvApiCtx,1) && sci_matrix_scalar_real(pvApiCtx,2) && sci_matrix_scalar_real(pvApiCtx,3) &&
		sci_matrix_scalar_real(pvApiCtx,4) && sci_matrix_scalar_real(pvApiCtx,5))
		*errCode = SUCCESS;
	else
		*errCode = UNKNOWN_INPUT_ERR;
	return;
}

void cmorlet_content_validate(void * pvApiCtx, int *errCode, double* input1, double* input2, int* input3, double* input4 , double* input5)
{
    *errCode = SUCCESS;
	if ((input1[0]>=input2[0]) || (input3[0]<2))
		*errCode = UNKNOWN_INPUT_ERR;
	return;
}

/*-------------------------------------------
 * Complex Shannon
 *-----------------------------------------*/

void shanwavf_form_validate(void * pvApiCtx, int *errCode)
{
    if (sci_matrix_scalar_real(pvApiCtx,1) && sci_matrix_scalar_real(pvApiCtx,2) && sci_matrix_scalar_real(pvApiCtx,3) &&
		sci_matrix_scalar_real(pvApiCtx,4) && sci_matrix_scalar_real(pvApiCtx,5))
		*errCode = SUCCESS;
	else
		*errCode = UNKNOWN_INPUT_ERR;
	return;
}

void shanwavf_content_validate(void * pvApiCtx, int *errCode, double* input1, double* input2, int* input3, double* input4 , double* input5)
{
    *errCode = SUCCESS;
	if ((input1[0]>=input2[0]) || (input3[0]<2))
		*errCode = UNKNOWN_INPUT_ERR;
	return;
}

/*-------------------------------------------
 * Frequency B-Spline
 *-----------------------------------------*/

void fbspwavf_form_validate(void * pvApiCtx, int *errCode)
{
    if (sci_matrix_scalar_real(pvApiCtx,1) && sci_matrix_scalar_real(pvApiCtx,2) && sci_matrix_scalar_real(pvApiCtx,3) &&
		sci_matrix_scalar_real(pvApiCtx,4) && sci_matrix_scalar_real(pvApiCtx,5))
		*errCode = SUCCESS;
	else
		*errCode = UNKNOWN_INPUT_ERR;
	return;
}

void fbspwavf_content_validate(void * pvApiCtx, int *errCode, double* input1, double* input2, int* input3, int* input4, double* input5, double* input6)
{
    *errCode = SUCCESS;
	if ((input1[0]>=input2[0]) || (input3[0]<2) || (input4[0]<1))
		*errCode = UNKNOWN_INPUT_ERR;
	return;
}

/*-------------------------------------------
 * Complex Cauchy
 *-----------------------------------------*/

void cauchy_form_validate(void * pvApiCtx, int *errCode)
{
    if (sci_matrix_scalar_real(pvApiCtx,1) && sci_matrix_scalar_real(pvApiCtx,2) && sci_matrix_scalar_real(pvApiCtx,3)) //&&
//		sci_matrix_scalar_real(pvApiCtx,4) && sci_matrix_scalar_real(pvApiCtx,5))
		*errCode = SUCCESS;
	else
		*errCode = UNKNOWN_INPUT_ERR;
	return;
}

void cauchy_content_validate(void * pvApiCtx, int *errCode, double* input1, double* input2, int* input3)
{
    *errCode = SUCCESS;
	if ((input1[0]>=input2[0]) || (input3[0]<2))
		*errCode = UNKNOWN_INPUT_ERR;
	return;
}

/*-------------------------------------------
 * wavefun
 *-----------------------------------------*/
void wavefun_form_validate(void * pvApiCtx, int *errCode)
{
    if (sci_strings_scalar(pvApiCtx,1) && sci_matrix_scalar_real(pvApiCtx,2))
		*errCode = SUCCESS;
	else
		*errCode = UNKNOWN_INPUT_ERR;
	return;
}

void wavefun_content_validate(void * pvApiCtx, int *errCode, char *input_string, int* input2)
{
	int ind1, ind2;
    *errCode = SUCCESS;
	if (input2[0] < 0)
	{
		*errCode = UNKNOWN_INPUT_ERR;
		return;
	}
    wavelet_fun_parser (input_string, &ind1);
	cwt_fun_parser(input_string, &ind2);
	if ((ind1==-1) && (ind2==-1))
	{
		*errCode = UNKNOWN_INPUT_ERR;
		return;
	}
	return;
}

/*-------------------------------------------
 * wavefun2
 *-----------------------------------------*/
void wavefun2_form_validate(void * pvApiCtx, int *errCode)
{
    if (sci_strings_scalar(pvApiCtx,1) && sci_matrix_scalar_real(pvApiCtx,2))
		*errCode = SUCCESS;
	else
		*errCode = UNKNOWN_INPUT_ERR;
	return;
}

void wavefun2_content_validate(void * pvApiCtx, int *errCode, char *input_string, int* input2)
{
	int ind1;
    *errCode = SUCCESS;
	if (input2[0] < 0)
	{
		*errCode = UNKNOWN_INPUT_ERR;
		return;
	}
    wavelet_fun_parser (input_string, &ind1);
	//cwt_fun_parser(input_string, &ind2);
	if (ind1==-1)
	{
		*errCode = UNKNOWN_INPUT_ERR;
		return;
	}
	return;
}

/*-------------------------------------------
 * cwt
 *-----------------------------------------*/
void cwt_form_validate(void * pvApiCtx, int *errCode, int *flow)
{
    if (sci_matrix_vector_real(pvApiCtx,1) && (sci_matrix_vector_real(pvApiCtx,2) || sci_matrix_scalar_real(pvApiCtx,2)) && sci_strings_scalar(pvApiCtx,3) )
	{
		*errCode = SUCCESS;
		*flow = 1;
	}
	else if (sci_matrix_vector_complex(pvApiCtx,1) && sci_matrix_vector_real(pvApiCtx,2) && sci_strings_scalar(pvApiCtx,3) )
	{
        *errCode = SUCCESS;
		*flow = 2;
	}
	else
		*errCode = UNKNOWN_INPUT_ERR;
	return;
}

void cwt_content_validate(void * pvApiCtx, int *errCode, char *input_string)
{
	int ind1, ind2;
    *errCode = SUCCESS;

    wavelet_fun_parser (input_string, &ind1);
	cwt_fun_parser(input_string, &ind2);
	if ((ind1==-1) && (ind2==-1))
	{
		*errCode = UNKNOWN_INPUT_ERR;
		return;
	}
	return;
}
