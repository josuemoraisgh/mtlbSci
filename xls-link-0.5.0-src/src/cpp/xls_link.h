#ifndef _XLS_LINK_H
#define _XLS_LINK_H

#ifdef XLS_LINK_EXPORTS
#  define XLS_LINK_API __declspec(dllexport)
#else
#  define XLS_LINK_API __declspec(dllimport)
#endif

#endif
