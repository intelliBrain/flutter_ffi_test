#ifdef WIN32
#define EXPORT __declspec(dllexport)
#else
#define EXPORT extern "C" __attribute__((visibility("default"))) __attribute__((used))
#endif

#include <cstring>
#include <ctype.h>

static char buffer[1024];

EXPORT
int add(int a, int b)
{
  return a + b;
}

EXPORT
char *capitalize(char *str)
{
  if (str != NULL)
  {
    size_t len = strlen(str);
    strcpy_s(buffer, str);

    for (int i = 0; i < len; i++)
    {
      buffer[i] = toupper(buffer[i]);
    }
  }

  return buffer;
}