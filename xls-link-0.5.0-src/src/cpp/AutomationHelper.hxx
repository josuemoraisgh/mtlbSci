/*--------------------------------------------------------------------------*/
/* Allan CORNET */
/* DIGITEO 2008 - 2010 */
/*--------------------------------------------------------------------------*/

#ifndef __AUTOMATIONHELPER_HXX__
#define __AUTOMATIONHELPER_HXX__

#include <windows.h>

#define DIM_MAX 2

/**
 * @brief Automation helper function
 */
HRESULT XLS_LINK_Wrap(int autoType, VARIANT *pvResult, IDispatch *pDisp, LPOLESTR ptName, int cArgs, VARIANT* _pArgs, int _cNamedArgIDs, DISPID *_pNamedArgIDs);
BOOL GetDimensions(SAFEARRAY *pSafeArray, int *m, int *n);


#endif /* __AUTOMATIONHELPER_HXX__ */
/*--------------------------------------------------------------------------*/