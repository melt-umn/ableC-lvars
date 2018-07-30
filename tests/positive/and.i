# 1 "positive/and.xc"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "positive/and.xc"
# 1 "../../../extensions/ableC-lvars/include/lvars.xh" 1
# 1 "../../../extensions/ableC-string/include/string.xh" 1
# 1 "/usr/include/string.h" 1 3 4
# 25 "/usr/include/string.h" 3 4
# 1 "/usr/include/features.h" 1 3 4
# 367 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 1 3 4
# 410 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 411 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 2 3 4
# 368 "/usr/include/features.h" 2 3 4
# 391 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 1 3 4
# 10 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h" 1 3 4
# 11 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 2 3 4
# 392 "/usr/include/features.h" 2 3 4
# 26 "/usr/include/string.h" 2 3 4






# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stddef.h" 1 3 4
# 212 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 33 "/usr/include/string.h" 2 3 4









extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
       size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern void *memmove (void *__dest, const void *__src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

# 60 "/usr/include/string.h" 3 4


extern void *memset (void *__s, int __c, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int memcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 92 "/usr/include/string.h" 3 4
extern void *memchr (const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


# 123 "/usr/include/string.h" 3 4


extern char *strcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern char *strcat (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncat (char *__restrict __dest, const char *__restrict __src,
        size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern int strncmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcoll (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern size_t strxfrm (char *__restrict __dest,
         const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

# 206 "/usr/include/string.h" 3 4

# 231 "/usr/include/string.h" 3 4
extern char *strchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 258 "/usr/include/string.h" 3 4
extern char *strrchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


# 277 "/usr/include/string.h" 3 4



extern size_t strcspn (const char *__s, const char *__reject)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern size_t strspn (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 310 "/usr/include/string.h" 3 4
extern char *strpbrk (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 337 "/usr/include/string.h" 3 4
extern char *strstr (const char *__haystack, const char *__needle)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));




extern char *strtok (char *__restrict __s, const char *__restrict __delim)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));




extern char *__strtok_r (char *__restrict __s,
    const char *__restrict __delim,
    char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));

extern char *strtok_r (char *__restrict __s, const char *__restrict __delim,
         char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
# 392 "/usr/include/string.h" 3 4


extern size_t strlen (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));

# 406 "/usr/include/string.h" 3 4


extern char *strerror (int __errnum) __attribute__ ((__nothrow__ , __leaf__));

# 446 "/usr/include/string.h" 3 4
extern void __bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 658 "/usr/include/string.h" 3 4

# 2 "../../../extensions/ableC-string/include/string.xh" 2
# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stdbool.h" 1 3 4
# 3 "../../../extensions/ableC-string/include/string.xh" 2
# 1 "/usr/include/stdio.h" 1 3 4
# 29 "/usr/include/stdio.h" 3 4




# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stddef.h" 1 3 4
# 34 "/usr/include/stdio.h" 2 3 4

# 1 "/usr/include/x86_64-linux-gnu/bits/types.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/bits/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 28 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4


typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;


typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;

typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;







typedef long int __quad_t;
typedef unsigned long int __u_quad_t;
# 121 "/usr/include/x86_64-linux-gnu/bits/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/typesizes.h" 1 3 4
# 122 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4


typedef unsigned long int __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long int __ino_t;
typedef unsigned long int __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long int __nlink_t;
typedef long int __off_t;
typedef long int __off64_t;
typedef int __pid_t;
typedef struct { int __val[2]; } __fsid_t;
typedef long int __clock_t;
typedef unsigned long int __rlim_t;
typedef unsigned long int __rlim64_t;
typedef unsigned int __id_t;
typedef long int __time_t;
typedef unsigned int __useconds_t;
typedef long int __suseconds_t;

typedef int __daddr_t;
typedef int __key_t;


typedef int __clockid_t;


typedef void * __timer_t;


typedef long int __blksize_t;




typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;


typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;


typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;


typedef long int __fsword_t;

typedef long int __ssize_t;


typedef long int __syscall_slong_t;

typedef unsigned long int __syscall_ulong_t;



typedef __off64_t __loff_t;
typedef __quad_t *__qaddr_t;
typedef char *__caddr_t;


typedef long int __intptr_t;


typedef unsigned int __socklen_t;
# 36 "/usr/include/stdio.h" 2 3 4
# 44 "/usr/include/stdio.h" 3 4
struct _IO_FILE;



typedef struct _IO_FILE FILE;





# 64 "/usr/include/stdio.h" 3 4
typedef struct _IO_FILE __FILE;
# 74 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/libio.h" 1 3 4
# 31 "/usr/include/libio.h" 3 4
# 1 "/usr/include/_G_config.h" 1 3 4
# 15 "/usr/include/_G_config.h" 3 4
# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stddef.h" 1 3 4
# 16 "/usr/include/_G_config.h" 2 3 4




# 1 "/usr/include/wchar.h" 1 3 4
# 82 "/usr/include/wchar.h" 3 4
typedef struct
{
  int __count;
  union
  {

    unsigned int __wch;



    char __wchb[4];
  } __value;
} __mbstate_t;
# 21 "/usr/include/_G_config.h" 2 3 4
typedef struct
{
  __off_t __pos;
  __mbstate_t __state;
} _G_fpos_t;
typedef struct
{
  __off64_t __pos;
  __mbstate_t __state;
} _G_fpos64_t;
# 32 "/usr/include/libio.h" 2 3 4
# 49 "/usr/include/libio.h" 3 4
# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stdarg.h" 1 3 4
# 40 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 50 "/usr/include/libio.h" 2 3 4
# 144 "/usr/include/libio.h" 3 4
struct _IO_jump_t; struct _IO_FILE;





typedef void _IO_lock_t;





struct _IO_marker {
  struct _IO_marker *_next;
  struct _IO_FILE *_sbuf;



  int _pos;
# 173 "/usr/include/libio.h" 3 4
};


enum __codecvt_result
{
  __codecvt_ok,
  __codecvt_partial,
  __codecvt_error,
  __codecvt_noconv
};
# 241 "/usr/include/libio.h" 3 4
struct _IO_FILE {
  int _flags;




  char* _IO_read_ptr;
  char* _IO_read_end;
  char* _IO_read_base;
  char* _IO_write_base;
  char* _IO_write_ptr;
  char* _IO_write_end;
  char* _IO_buf_base;
  char* _IO_buf_end;

  char *_IO_save_base;
  char *_IO_backup_base;
  char *_IO_save_end;

  struct _IO_marker *_markers;

  struct _IO_FILE *_chain;

  int _fileno;



  int _flags2;

  __off_t _old_offset;



  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];



  _IO_lock_t *_lock;
# 289 "/usr/include/libio.h" 3 4
  __off64_t _offset;







  void *__pad1;
  void *__pad2;
  void *__pad3;
  void *__pad4;

  size_t __pad5;
  int _mode;

  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];

};


typedef struct _IO_FILE _IO_FILE;


struct _IO_FILE_plus;

extern struct _IO_FILE_plus _IO_2_1_stdin_;
extern struct _IO_FILE_plus _IO_2_1_stdout_;
extern struct _IO_FILE_plus _IO_2_1_stderr_;
# 333 "/usr/include/libio.h" 3 4
typedef __ssize_t __io_read_fn (void *__cookie, char *__buf, size_t __nbytes);







typedef __ssize_t __io_write_fn (void *__cookie, const char *__buf,
     size_t __n);







typedef int __io_seek_fn (void *__cookie, __off64_t *__pos, int __w);


typedef int __io_close_fn (void *__cookie);
# 385 "/usr/include/libio.h" 3 4
extern int __underflow (_IO_FILE *);
extern int __uflow (_IO_FILE *);
extern int __overflow (_IO_FILE *, int);
# 429 "/usr/include/libio.h" 3 4
extern int _IO_getc (_IO_FILE *__fp);
extern int _IO_putc (int __c, _IO_FILE *__fp);
extern int _IO_feof (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_ferror (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf__));

extern int _IO_peekc_locked (_IO_FILE *__fp);





extern void _IO_flockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern void _IO_funlockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_ftrylockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
# 459 "/usr/include/libio.h" 3 4
extern int _IO_vfscanf (_IO_FILE * __restrict, const char * __restrict,
   __gnuc_va_list, int *__restrict);
extern int _IO_vfprintf (_IO_FILE *__restrict, const char *__restrict,
    __gnuc_va_list);
extern __ssize_t _IO_padn (_IO_FILE *, int, __ssize_t);
extern size_t _IO_sgetn (_IO_FILE *, void *, size_t);

extern __off64_t _IO_seekoff (_IO_FILE *, __off64_t, int, int);
extern __off64_t _IO_seekpos (_IO_FILE *, __off64_t, int);

extern void _IO_free_backup_area (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
# 75 "/usr/include/stdio.h" 2 3 4
# 108 "/usr/include/stdio.h" 3 4


typedef _G_fpos_t fpos_t;




# 164 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h" 1 3 4
# 165 "/usr/include/stdio.h" 2 3 4



extern struct _IO_FILE *stdin;
extern struct _IO_FILE *stdout;
extern struct _IO_FILE *stderr;







extern int remove (const char *__filename) __attribute__ ((__nothrow__ , __leaf__));

extern int rename (const char *__old, const char *__new) __attribute__ ((__nothrow__ , __leaf__));














extern FILE *tmpfile (void) ;
# 209 "/usr/include/stdio.h" 3 4
extern char *tmpnam (char *__s) __attribute__ ((__nothrow__ , __leaf__)) ;

# 232 "/usr/include/stdio.h" 3 4





extern int fclose (FILE *__stream);




extern int fflush (FILE *__stream);

# 266 "/usr/include/stdio.h" 3 4






extern FILE *fopen (const char *__restrict __filename,
      const char *__restrict __modes) ;




extern FILE *freopen (const char *__restrict __filename,
        const char *__restrict __modes,
        FILE *__restrict __stream) ;
# 295 "/usr/include/stdio.h" 3 4

# 306 "/usr/include/stdio.h" 3 4
extern FILE *fdopen (int __fd, const char *__modes) __attribute__ ((__nothrow__ , __leaf__)) ;
# 329 "/usr/include/stdio.h" 3 4



extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));



extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) __attribute__ ((__nothrow__ , __leaf__));

# 351 "/usr/include/stdio.h" 3 4





extern int fprintf (FILE *__restrict __stream,
      const char *__restrict __format, ...);




extern int printf (const char *__restrict __format, ...);

extern int sprintf (char *__restrict __s,
      const char *__restrict __format, ...) __attribute__ ((__nothrow__));





extern int vfprintf (FILE *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg);




extern int vprintf (const char *__restrict __format, __gnuc_va_list __arg);

extern int vsprintf (char *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg) __attribute__ ((__nothrow__));





extern int snprintf (char *__restrict __s, size_t __maxlen,
       const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 4)));

extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 0)));

# 420 "/usr/include/stdio.h" 3 4





extern int fscanf (FILE *__restrict __stream,
     const char *__restrict __format, ...) ;




extern int scanf (const char *__restrict __format, ...) ;

extern int sscanf (const char *__restrict __s,
     const char *__restrict __format, ...) __attribute__ ((__nothrow__ , __leaf__));
# 463 "/usr/include/stdio.h" 3 4








extern int vfscanf (FILE *__restrict __s, const char *__restrict __format,
      __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) ;





extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;


extern int vsscanf (const char *__restrict __s,
      const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format__ (__scanf__, 2, 0)));
# 522 "/usr/include/stdio.h" 3 4









extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);





extern int getchar (void);

# 550 "/usr/include/stdio.h" 3 4
extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);
# 565 "/usr/include/stdio.h" 3 4








extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);





extern int putchar (int __c);

# 602 "/usr/include/stdio.h" 3 4
extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);
# 617 "/usr/include/stdio.h" 3 4





extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
     ;
# 640 "/usr/include/stdio.h" 3 4

# 684 "/usr/include/stdio.h" 3 4





extern int fputs (const char *__restrict __s, FILE *__restrict __stream);





extern int puts (const char *__s);






extern int ungetc (int __c, FILE *__stream);






extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream) ;




extern size_t fwrite (const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s);

# 744 "/usr/include/stdio.h" 3 4





extern int fseek (FILE *__stream, long int __off, int __whence);




extern long int ftell (FILE *__stream) ;




extern void rewind (FILE *__stream);

# 792 "/usr/include/stdio.h" 3 4






extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);




extern int fsetpos (FILE *__stream, const fpos_t *__pos);
# 815 "/usr/include/stdio.h" 3 4

# 824 "/usr/include/stdio.h" 3 4


extern void clearerr (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));

extern int feof (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;

extern int ferror (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;

# 841 "/usr/include/stdio.h" 3 4





extern void perror (const char *__s);






# 1 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h" 1 3 4
# 854 "/usr/include/stdio.h" 2 3 4




extern int fileno (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;
# 884 "/usr/include/stdio.h" 3 4
extern char *ctermid (char *__s) __attribute__ ((__nothrow__ , __leaf__));
# 912 "/usr/include/stdio.h" 3 4
extern void flockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));



extern int ftrylockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;


extern void funlockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
# 942 "/usr/include/stdio.h" 3 4

# 4 "../../../extensions/ableC-string/include/string.xh" 2
# 1 "/usr/include/stdlib.h" 1 3 4
# 32 "/usr/include/stdlib.h" 3 4
# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stddef.h" 1 3 4
# 324 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stddef.h" 3 4
typedef int wchar_t;
# 33 "/usr/include/stdlib.h" 2 3 4


# 95 "/usr/include/stdlib.h" 3 4


typedef struct
  {
    int quot;
    int rem;
  } div_t;



typedef struct
  {
    long int quot;
    long int rem;
  } ldiv_t;







__extension__ typedef struct
  {
    long long int quot;
    long long int rem;
  } lldiv_t;


# 139 "/usr/include/stdlib.h" 3 4
extern size_t __ctype_get_mb_cur_max (void) __attribute__ ((__nothrow__ , __leaf__)) ;




extern double atof (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern int atoi (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern long int atol (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





__extension__ extern long long int atoll (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





extern double strtod (const char *__restrict __nptr,
        char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern float strtof (const char *__restrict __nptr,
       char **__restrict __endptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern long double strtold (const char *__restrict __nptr,
       char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern long int strtol (const char *__restrict __nptr,
   char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern unsigned long int strtoul (const char *__restrict __nptr,
      char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

# 206 "/usr/include/stdlib.h" 3 4


__extension__
extern long long int strtoll (const char *__restrict __nptr,
         char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

__extension__
extern unsigned long long int strtoull (const char *__restrict __nptr,
     char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

# 372 "/usr/include/stdlib.h" 3 4


extern int rand (void) __attribute__ ((__nothrow__ , __leaf__));

extern void srand (unsigned int __seed) __attribute__ ((__nothrow__ , __leaf__));




extern int rand_r (unsigned int *__seed) __attribute__ ((__nothrow__ , __leaf__));
# 464 "/usr/include/stdlib.h" 3 4


extern void *malloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;

extern void *calloc (size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;










extern void *realloc (void *__ptr, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));

extern void free (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));

# 509 "/usr/include/stdlib.h" 3 4
extern void *aligned_alloc (size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__alloc_size__ (2))) ;




extern void abort (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));



extern int atexit (void (*__func) (void)) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));







extern int at_quick_exit (void (*__func) (void)) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



# 539 "/usr/include/stdlib.h" 3 4




extern void exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));





extern void quick_exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));







extern void _Exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));






extern char *getenv (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;

# 711 "/usr/include/stdlib.h" 3 4





extern int system (const char *__command) ;

# 741 "/usr/include/stdlib.h" 3 4
typedef int (*__compar_fn_t) (const void *, const void *);
# 751 "/usr/include/stdlib.h" 3 4



extern void *bsearch (const void *__key, const void *__base,
        size_t __nmemb, size_t __size, __compar_fn_t __compar)
     __attribute__ ((__nonnull__ (1, 2, 5))) ;







extern void qsort (void *__base, size_t __nmemb, size_t __size,
     __compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));
# 774 "/usr/include/stdlib.h" 3 4
extern int abs (int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;
extern long int labs (long int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;



__extension__ extern long long int llabs (long long int __x)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;







extern div_t div (int __numer, int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;
extern ldiv_t ldiv (long int __numer, long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;




__extension__ extern lldiv_t lldiv (long long int __numer,
        long long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;

# 859 "/usr/include/stdlib.h" 3 4



extern int mblen (const char *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));


extern int mbtowc (wchar_t *__restrict __pwc,
     const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));


extern int wctomb (char *__s, wchar_t __wchar) __attribute__ ((__nothrow__ , __leaf__));



extern size_t mbstowcs (wchar_t *__restrict __pwcs,
   const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));

extern size_t wcstombs (char *__restrict __s,
   const wchar_t *__restrict __pwcs, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__));

# 954 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h" 1 3 4
# 955 "/usr/include/stdlib.h" 2 3 4
# 967 "/usr/include/stdlib.h" 3 4

# 5 "../../../extensions/ableC-string/include/string.xh" 2
# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include-fixed/limits.h" 1 3 4
# 34 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include-fixed/limits.h" 3 4
# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include-fixed/syslimits.h" 1 3 4






# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include-fixed/limits.h" 1 3 4
# 168 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include-fixed/limits.h" 3 4
# 1 "/usr/include/limits.h" 1 3 4
# 143 "/usr/include/limits.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/posix1_lim.h" 1 3 4
# 160 "/usr/include/x86_64-linux-gnu/bits/posix1_lim.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/local_lim.h" 1 3 4
# 38 "/usr/include/x86_64-linux-gnu/bits/local_lim.h" 3 4
# 1 "/usr/include/linux/limits.h" 1 3 4
# 39 "/usr/include/x86_64-linux-gnu/bits/local_lim.h" 2 3 4
# 161 "/usr/include/x86_64-linux-gnu/bits/posix1_lim.h" 2 3 4
# 144 "/usr/include/limits.h" 2 3 4
# 169 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include-fixed/limits.h" 2 3 4
# 8 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include-fixed/syslimits.h" 2 3 4
# 35 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include-fixed/limits.h" 2 3 4
# 6 "../../../extensions/ableC-string/include/string.xh" 2
# 1 "../../../extensions/ableC-string/include/gc.h" 1
# 39 "../../../extensions/ableC-string/include/gc.h"
# 1 "../../../extensions/ableC-string/include/gc_version.h" 1
# 40 "../../../extensions/ableC-string/include/gc.h" 2






# 1 "../../../extensions/ableC-string/include/gc_config_macros.h" 1
# 155 "../../../extensions/ableC-string/include/gc_config_macros.h"
# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stddef.h" 1 3 4
# 147 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stddef.h" 3 4
typedef long int ptrdiff_t;
# 422 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stddef.h" 3 4
typedef struct {
  long long __max_align_ll __attribute__((__aligned__(__alignof__(long long))));
  long double __max_align_ld __attribute__((__aligned__(__alignof__(long double))));
} max_align_t;
# 156 "../../../extensions/ableC-string/include/gc_config_macros.h" 2
# 47 "../../../extensions/ableC-string/include/gc.h" 2





typedef void * GC_PTR;
# 70 "../../../extensions/ableC-string/include/gc.h"
  typedef unsigned long GC_word;
  typedef long GC_signed_word;




extern unsigned GC_get_version(void);




extern __attribute__((__deprecated__)) GC_word GC_gc_no;


extern GC_word GC_get_gc_no(void);
# 113 "../../../extensions/ableC-string/include/gc.h"
typedef void * ( * GC_oom_func)(size_t );
extern __attribute__((__deprecated__)) GC_oom_func GC_oom_fn;
# 124 "../../../extensions/ableC-string/include/gc.h"
extern void GC_set_oom_fn(GC_oom_func) __attribute__((__nonnull__(1)));
extern GC_oom_func GC_get_oom_fn(void);

typedef void ( * GC_on_heap_resize_proc)(GC_word );
extern __attribute__((__deprecated__)) GC_on_heap_resize_proc GC_on_heap_resize;



extern void GC_set_on_heap_resize(GC_on_heap_resize_proc);
extern GC_on_heap_resize_proc GC_get_on_heap_resize(void);



typedef enum {
    GC_EVENT_START ,
    GC_EVENT_MARK_START,
    GC_EVENT_MARK_END,
    GC_EVENT_RECLAIM_START,
    GC_EVENT_RECLAIM_END,
    GC_EVENT_END ,
    GC_EVENT_PRE_STOP_WORLD ,
    GC_EVENT_POST_STOP_WORLD ,
    GC_EVENT_PRE_START_WORLD ,
    GC_EVENT_POST_START_WORLD ,
    GC_EVENT_THREAD_SUSPENDED,
    GC_EVENT_THREAD_UNSUSPENDED
} GC_EventType;

typedef void ( * GC_on_collection_event_proc)(GC_EventType);





extern void GC_set_on_collection_event(GC_on_collection_event_proc);
extern GC_on_collection_event_proc GC_get_on_collection_event(void);
# 176 "../../../extensions/ableC-string/include/gc.h"
extern __attribute__((__deprecated__)) int GC_find_leak;
# 185 "../../../extensions/ableC-string/include/gc.h"
extern void GC_set_find_leak(int);
extern int GC_get_find_leak(void);

extern __attribute__((__deprecated__)) int GC_all_interior_pointers;
# 201 "../../../extensions/ableC-string/include/gc.h"
extern void GC_set_all_interior_pointers(int);
extern int GC_get_all_interior_pointers(void);

extern __attribute__((__deprecated__)) int GC_finalize_on_demand;






extern void GC_set_finalize_on_demand(int);
extern int GC_get_finalize_on_demand(void);

extern __attribute__((__deprecated__)) int GC_java_finalization;
# 223 "../../../extensions/ableC-string/include/gc.h"
extern void GC_set_java_finalization(int);
extern int GC_get_java_finalization(void);

typedef void ( * GC_finalizer_notifier_proc)(void);
extern __attribute__((__deprecated__)) GC_finalizer_notifier_proc GC_finalizer_notifier;
# 237 "../../../extensions/ableC-string/include/gc.h"
extern void GC_set_finalizer_notifier(GC_finalizer_notifier_proc);
extern GC_finalizer_notifier_proc GC_get_finalizer_notifier(void);

extern

    __attribute__((__deprecated__))

  int GC_dont_gc;
# 254 "../../../extensions/ableC-string/include/gc.h"
extern __attribute__((__deprecated__)) int GC_dont_expand;



extern void GC_set_dont_expand(int);
extern int GC_get_dont_expand(void);

extern __attribute__((__deprecated__)) int GC_use_entire_heap;
# 272 "../../../extensions/ableC-string/include/gc.h"
extern __attribute__((__deprecated__)) int GC_full_freq;
# 286 "../../../extensions/ableC-string/include/gc.h"
extern void GC_set_full_freq(int);
extern int GC_get_full_freq(void);

extern __attribute__((__deprecated__)) GC_word GC_non_gc_bytes;
# 299 "../../../extensions/ableC-string/include/gc.h"
extern void GC_set_non_gc_bytes(GC_word);
extern GC_word GC_get_non_gc_bytes(void);

extern __attribute__((__deprecated__)) int GC_no_dls;
# 311 "../../../extensions/ableC-string/include/gc.h"
extern void GC_set_no_dls(int);
extern int GC_get_no_dls(void);

extern __attribute__((__deprecated__)) GC_word GC_free_space_divisor;
# 333 "../../../extensions/ableC-string/include/gc.h"
extern void GC_set_free_space_divisor(GC_word);
extern GC_word GC_get_free_space_divisor(void);

extern __attribute__((__deprecated__)) GC_word GC_max_retries;







extern void GC_set_max_retries(GC_word);
extern GC_word GC_get_max_retries(void);


extern __attribute__((__deprecated__)) char *GC_stackbottom;
# 364 "../../../extensions/ableC-string/include/gc.h"
extern __attribute__((__deprecated__)) int GC_dont_precollect;
# 375 "../../../extensions/ableC-string/include/gc.h"
extern void GC_set_dont_precollect(int);
extern int GC_get_dont_precollect(void);

extern __attribute__((__deprecated__)) unsigned long GC_time_limit;
# 395 "../../../extensions/ableC-string/include/gc.h"
extern void GC_set_time_limit(unsigned long);
extern unsigned long GC_get_time_limit(void);
# 405 "../../../extensions/ableC-string/include/gc.h"
extern void GC_start_performance_measurement(void);






extern unsigned long GC_get_full_gc_total_time(void);
# 422 "../../../extensions/ableC-string/include/gc.h"
extern void GC_set_pages_executable(int);





extern int GC_get_pages_executable(void);




extern void GC_set_min_bytes_allocd(size_t);
extern size_t GC_get_min_bytes_allocd(void);



extern void GC_set_rate(int);
extern int GC_get_rate(void);



extern void GC_set_max_prior_attempts(int);
extern int GC_get_max_prior_attempts(void);
# 458 "../../../extensions/ableC-string/include/gc.h"
extern void GC_set_handle_fork(int);
# 467 "../../../extensions/ableC-string/include/gc.h"
extern void GC_atfork_prepare(void);
extern void GC_atfork_parent(void);
extern void GC_atfork_child(void);



extern void GC_init(void);



extern int GC_is_init_called(void);




extern void GC_deinit(void);
# 493 "../../../extensions/ableC-string/include/gc.h"
extern __attribute__((__malloc__)) __attribute__((__alloc_size__(1))) void *
        GC_malloc(size_t );
extern __attribute__((__malloc__)) __attribute__((__alloc_size__(1))) void *
        GC_malloc_atomic(size_t );
extern __attribute__((__malloc__)) char * GC_strdup(const char *);
extern __attribute__((__malloc__)) char *
        GC_strndup(const char *, size_t) __attribute__((__nonnull__(1)));
extern __attribute__((__malloc__)) __attribute__((__alloc_size__(1))) void *
        GC_malloc_uncollectable(size_t );
extern __attribute__((__deprecated__)) void * GC_malloc_stubborn(size_t);


extern __attribute__((__malloc__)) __attribute__((__alloc_size__(2))) void *
        GC_memalign(size_t , size_t );
extern int GC_posix_memalign(void ** , size_t ,
                        size_t ) __attribute__((__nonnull__(1)));







extern void GC_free(void *);






extern __attribute__((__deprecated__)) void GC_change_stubborn(const void *);





extern void GC_end_stubborn_change(const void *) __attribute__((__nonnull__(1)));
# 542 "../../../extensions/ableC-string/include/gc.h"
extern void * GC_base(void * );





extern int GC_is_heap_ptr(const void *);




extern size_t GC_size(const void * ) __attribute__((__nonnull__(1)));
# 575 "../../../extensions/ableC-string/include/gc.h"
extern void * GC_realloc(void * ,
                                 size_t )
                                             __attribute__((__alloc_size__(2)));



extern int GC_expand_hp(size_t );






extern void GC_set_max_heap_size(GC_word );







extern void GC_exclude_static_roots(void * ,
                                            void * );


extern void GC_clear_roots(void);




extern void GC_add_roots(void * ,
                                 void * );



extern void GC_remove_roots(void * ,
                                    void * );
# 625 "../../../extensions/ableC-string/include/gc.h"
extern void GC_register_displacement(size_t );



extern void GC_debug_register_displacement(size_t );


extern void GC_gcollect(void);






extern void GC_gcollect_and_unmap(void);
# 654 "../../../extensions/ableC-string/include/gc.h"
typedef int ( * GC_stop_func)(void);
extern int GC_try_to_collect(GC_stop_func )
                                                        __attribute__((__nonnull__(1)));





extern void GC_set_stop_func(GC_stop_func )
                                                        __attribute__((__nonnull__(1)));
extern GC_stop_func GC_get_stop_func(void);
# 679 "../../../extensions/ableC-string/include/gc.h"
extern size_t GC_get_heap_size(void);




extern size_t GC_get_free_bytes(void);





extern size_t GC_get_unmapped_bytes(void);




extern size_t GC_get_bytes_since_gc(void);



extern size_t GC_get_expl_freed_bytes_since_gc(void);




extern size_t GC_get_total_bytes(void);
# 713 "../../../extensions/ableC-string/include/gc.h"
extern void GC_get_heap_usage_safe(GC_word * ,
                                           GC_word * ,
                                           GC_word * ,
                                           GC_word * ,
                                           GC_word * );





struct GC_prof_stats_s {
  GC_word heapsize_full;


  GC_word free_bytes_full;


  GC_word unmapped_bytes;


  GC_word bytes_allocd_since_gc;


  GC_word allocd_bytes_before_gc;



  GC_word non_gc_bytes;


  GC_word gc_no;


  GC_word markers_m1;



  GC_word bytes_reclaimed_since_gc;

  GC_word reclaimed_bytes_before_gc;


  GC_word expl_freed_bytes_since_gc;


};
# 769 "../../../extensions/ableC-string/include/gc.h"
extern size_t GC_get_prof_stats(struct GC_prof_stats_s *,
                                        size_t );
# 785 "../../../extensions/ableC-string/include/gc.h"
extern size_t GC_get_size_map_at(int i);



extern size_t GC_get_memory_use(void);



extern void GC_disable(void);



extern int GC_is_disabled(void);




extern void GC_enable(void);
# 815 "../../../extensions/ableC-string/include/gc.h"
extern void GC_enable_incremental(void);



extern int GC_is_incremental_mode(void);
# 830 "../../../extensions/ableC-string/include/gc.h"
extern int GC_incremental_protection_needs(void);
# 840 "../../../extensions/ableC-string/include/gc.h"
extern int GC_collect_a_little(void);
# 856 "../../../extensions/ableC-string/include/gc.h"
extern __attribute__((__malloc__)) __attribute__((__alloc_size__(1))) void *
        GC_malloc_ignore_off_page(size_t );
extern __attribute__((__malloc__)) __attribute__((__alloc_size__(1))) void *
        GC_malloc_atomic_ignore_off_page(size_t );
# 871 "../../../extensions/ableC-string/include/gc.h"
extern __attribute__((__malloc__)) __attribute__((__alloc_size__(1))) void *
        GC_malloc_atomic_uncollectable(size_t );
extern __attribute__((__malloc__)) __attribute__((__alloc_size__(1))) void *
        GC_debug_malloc_atomic_uncollectable(size_t, const char * s, int i);



extern __attribute__((__malloc__)) __attribute__((__alloc_size__(1))) void *
        GC_debug_malloc(size_t , const char * s, int i);
extern __attribute__((__malloc__)) __attribute__((__alloc_size__(1))) void *
        GC_debug_malloc_atomic(size_t , const char * s, int i);
extern __attribute__((__malloc__)) char *
        GC_debug_strdup(const char *, const char * s, int i);
extern __attribute__((__malloc__)) char *
        GC_debug_strndup(const char *, size_t, const char * s, int i)
                                                        __attribute__((__nonnull__(1)));
extern __attribute__((__malloc__)) __attribute__((__alloc_size__(1))) void *
        GC_debug_malloc_uncollectable(size_t ,
                                      const char * s, int i);
extern __attribute__((__deprecated__)) void *
        GC_debug_malloc_stubborn(size_t , const char * s, int i);
extern __attribute__((__malloc__)) __attribute__((__alloc_size__(1))) void *
        GC_debug_malloc_ignore_off_page(size_t ,
                                        const char * s, int i);
extern __attribute__((__malloc__)) __attribute__((__alloc_size__(1))) void *
        GC_debug_malloc_atomic_ignore_off_page(size_t ,
                                        const char * s, int i);
extern void GC_debug_free(void *);
extern void * GC_debug_realloc(void * ,
                        size_t , const char * s, int i)
                                             __attribute__((__alloc_size__(2)));
extern

  __attribute__((__deprecated__))

void GC_debug_change_stubborn(const void *);
extern void GC_debug_end_stubborn_change(const void *)
                                                        __attribute__((__nonnull__(1)));
# 922 "../../../extensions/ableC-string/include/gc.h"
extern __attribute__((__malloc__)) __attribute__((__alloc_size__(1))) void *
        GC_debug_malloc_replacement(size_t );
extern __attribute__((__alloc_size__(2))) void *
        GC_debug_realloc_replacement(void * ,
                                     size_t );
# 1024 "../../../extensions/ableC-string/include/gc.h"
typedef void ( * GC_finalization_proc)(void * ,
                                                  void * );

extern void GC_register_finalizer(void * ,
                        GC_finalization_proc , void * ,
                        GC_finalization_proc * , void ** )
                                                __attribute__((__nonnull__(1)));
extern void GC_debug_register_finalizer(void * ,
                        GC_finalization_proc , void * ,
                        GC_finalization_proc * , void ** )
                                                __attribute__((__nonnull__(1)));
# 1084 "../../../extensions/ableC-string/include/gc.h"
extern void GC_register_finalizer_ignore_self(void * ,
                        GC_finalization_proc , void * ,
                        GC_finalization_proc * , void ** )
                                                __attribute__((__nonnull__(1)));
extern void GC_debug_register_finalizer_ignore_self(void * ,
                        GC_finalization_proc , void * ,
                        GC_finalization_proc * , void ** )
                                                __attribute__((__nonnull__(1)));





extern void GC_register_finalizer_no_order(void * ,
                        GC_finalization_proc , void * ,
                        GC_finalization_proc * , void ** )
                                                __attribute__((__nonnull__(1)));
extern void GC_debug_register_finalizer_no_order(void * ,
                        GC_finalization_proc , void * ,
                        GC_finalization_proc * , void ** )
                                                __attribute__((__nonnull__(1)));
# 1122 "../../../extensions/ableC-string/include/gc.h"
extern void GC_register_finalizer_unreachable(void * ,
                        GC_finalization_proc , void * ,
                        GC_finalization_proc * , void ** )
                                                __attribute__((__nonnull__(1)));
extern void GC_debug_register_finalizer_unreachable(void * ,
                        GC_finalization_proc , void * ,
                        GC_finalization_proc * , void ** )
                                                __attribute__((__nonnull__(1)));
# 1140 "../../../extensions/ableC-string/include/gc.h"
extern int GC_register_disappearing_link(void ** )
                                                __attribute__((__nonnull__(1)));
# 1162 "../../../extensions/ableC-string/include/gc.h"
extern int GC_general_register_disappearing_link(void ** ,
                                                    const void * )
                        __attribute__((__nonnull__(1))) __attribute__((__nonnull__(2)));
# 1201 "../../../extensions/ableC-string/include/gc.h"
extern int GC_move_disappearing_link(void ** ,
                                             void ** )
                        __attribute__((__nonnull__(2)));
# 1216 "../../../extensions/ableC-string/include/gc.h"
extern int GC_unregister_disappearing_link(void ** );




extern int GC_register_long_link(void ** ,
                                    const void * )
                        __attribute__((__nonnull__(1))) __attribute__((__nonnull__(2)));
# 1232 "../../../extensions/ableC-string/include/gc.h"
extern int GC_move_long_link(void ** ,
                                     void ** )
                        __attribute__((__nonnull__(2)));



extern int GC_unregister_long_link(void ** );
# 1248 "../../../extensions/ableC-string/include/gc.h"
typedef enum {
   GC_TOGGLE_REF_DROP,
   GC_TOGGLE_REF_STRONG,
   GC_TOGGLE_REF_WEAK
} GC_ToggleRefStatus;





typedef GC_ToggleRefStatus ( *GC_toggleref_func)(void * );






extern void GC_set_toggleref_func(GC_toggleref_func);
extern GC_toggleref_func GC_get_toggleref_func(void);
# 1276 "../../../extensions/ableC-string/include/gc.h"
extern int GC_toggleref_add(void * , int )
                                                __attribute__((__nonnull__(1)));




typedef void ( * GC_await_finalize_proc)(void * );
extern void GC_set_await_finalize_proc(GC_await_finalize_proc);
extern GC_await_finalize_proc GC_get_await_finalize_proc(void);





extern int GC_should_invoke_finalizers(void);

extern int GC_invoke_finalizers(void);
# 1322 "../../../extensions/ableC-string/include/gc.h"
typedef void ( * GC_warn_proc)(char * ,
                                          GC_word );
extern void GC_set_warn_proc(GC_warn_proc ) __attribute__((__nonnull__(1)));

extern GC_warn_proc GC_get_warn_proc(void);



extern void GC_ignore_warn_proc(char *, GC_word);


extern void GC_set_log_fd(int);
# 1342 "../../../extensions/ableC-string/include/gc.h"
typedef void ( * GC_abort_func)(const char * );
extern void GC_set_abort_func(GC_abort_func) __attribute__((__nonnull__(1)));
extern GC_abort_func GC_get_abort_func(void);


extern void GC_abort_on_oom(void);
# 1357 "../../../extensions/ableC-string/include/gc.h"
typedef GC_word GC_hidden_pointer;
# 1371 "../../../extensions/ableC-string/include/gc.h"
typedef void * ( * GC_fn_type)(void * );
extern void * GC_call_with_alloc_lock(GC_fn_type ,
                                void * ) __attribute__((__nonnull__(1)));
# 1387 "../../../extensions/ableC-string/include/gc.h"
struct GC_stack_base {
  void * mem_base;



};

typedef void * ( * GC_stack_base_func)(
                struct GC_stack_base * , void * );





extern void * GC_call_with_stack_base(GC_stack_base_func ,
                                        void * ) __attribute__((__nonnull__(1)));
# 1512 "../../../extensions/ableC-string/include/gc.h"
extern void * GC_do_blocking(GC_fn_type ,
                                void * ) __attribute__((__nonnull__(1)));
# 1524 "../../../extensions/ableC-string/include/gc.h"
extern void * GC_call_with_gc_active(GC_fn_type ,
                                void * ) __attribute__((__nonnull__(1)));
# 1534 "../../../extensions/ableC-string/include/gc.h"
extern int GC_get_stack_base(struct GC_stack_base *)
                                                        __attribute__((__nonnull__(1)));
# 1546 "../../../extensions/ableC-string/include/gc.h"
extern void * GC_same_obj(void * , void * );





extern void * GC_pre_incr(void **, ptrdiff_t )
                                                        __attribute__((__nonnull__(1)));
extern void * GC_post_incr(void **, ptrdiff_t )
                                                        __attribute__((__nonnull__(1)));
# 1565 "../../../extensions/ableC-string/include/gc.h"
extern void * GC_is_visible(void * );






extern void * GC_is_valid_displacement(void * );







extern void GC_dump(void);






extern void GC_dump_named(const char * );



extern void GC_dump_regions(void);




extern void GC_dump_finalization(void);
# 1636 "../../../extensions/ableC-string/include/gc.h"
extern void ( * GC_same_obj_print_proc)(void * ,
                                                   void * );
extern void ( * GC_is_valid_displacement_print_proc)(void *);
extern void ( * GC_is_visible_print_proc)(void *);
# 1656 "../../../extensions/ableC-string/include/gc.h"
extern __attribute__((__malloc__)) void * GC_malloc_many(size_t );
# 1668 "../../../extensions/ableC-string/include/gc.h"
typedef int ( * GC_has_static_roots_func)(
                                        const char * ,
                                        void * ,
                                        size_t );





extern void GC_register_has_static_roots_callback(
                                        GC_has_static_roots_func);
# 1825 "../../../extensions/ableC-string/include/gc.h"
extern void GC_set_force_unmap_on_gcollect(int);
extern int GC_get_force_unmap_on_gcollect(void);
# 2003 "../../../extensions/ableC-string/include/gc.h"
extern void GC_win32_free_heap(void);
# 7 "../../../extensions/ableC-string/include/string.xh" 2




struct __attribute__((refId("edu:umn:cs:melt:exts:ableC:string:string"),
                      module("edu:umn:cs:melt:exts:ableC:string:string"))) _string_s {
  size_t length;
  const char *text;
};



static inline void _check_index_string(string s, size_t i) {
  if (i < 0 || i >= s.length) {
    fprintf(stderr, "String index out of bounds: length %lu, index %lu\n", s.length, i);
    exit(1);
  }
}

static inline char _index_string(string s, size_t i) {
  _check_index_string(s, i);
  return s.text[i];
}

static inline _Bool _eq_string(string s1, string s2) {
  return !strcmp(s1.text, s2.text);
}

static inline string _append_string(string s1, string s2) {
  char *result = GC_malloc(s1.length + s2.length + 1);
  strcpy(result, s1.text);
  strcat(result, s2.text);
  return (string){s1.length + s2.length, result};
}

static inline string _repeat_string(string s, size_t num) {
  char *result = GC_malloc(s.length * num + 1);
  result[0] = '\0';
  size_t i;
  for (size_t i = 0; i < num; i++)
    strcat(result, s.text);
  return (string){s.length * num, result};
}

static inline string _remove_string(string s1, string s2) {
  size_t i, j;
  char *result = GC_malloc(s1.length + 1);
  for (i = 0, j = 0; i < s1.length; i++) {
    if (i > s1.length - s2.length || strncmp(s1.text + i, s2.text, s2.length)) {
      result[j] = s1[i];
      j++;
    }
    else {
      i += s2.length - 1;
    }
  }
  result[j] = '\0';

  return (string){j, result};
}

static inline string _substring(string s, size_t start, size_t end) {
  if (start < 0 || start >= s.length || end < 0 || end >= s.length || start > end) {
    fprintf(stderr, "Substring index out of bounds: length %lu, start %lu, end %lu\n", s.length, start, end);
    exit(1);
  }
  char *result = GC_malloc(end - start + 1);
  strncpy(result, s.text + start, end - start);
  return (string){end - start, result};
}

static inline string strCharPointer(char *s) {
  size_t len = strlen(s);
  char *result = GC_malloc(len + 1);
  strcpy(result, s);
  return (string){len, result};
}

static inline string strChar(char c) {
  char *result = GC_malloc(2);
  result[0] = c;
  result[1] = '\0';
  return (string){1, result};
}

static inline string strPointer(void *ptr) {
  char *result = GC_malloc(9);
  sprintf(result, "%lx", (unsigned long)ptr);
  return (string){strlen(result), result};
}

static inline string showString(string s) {
  char *result = GC_malloc(2 * s.length + 3);
  result[0] = '\"';
  size_t resultIndex = 1;
  for (size_t i = 0; i < s.length; i++) {
    char *tmp;
    switch (s[i]) {
    case '\a':
      result[resultIndex++] = '\\';
      result[resultIndex++] = 'a';
      break;
    case '\b':
      result[resultIndex++] = '\\';
      result[resultIndex++] = 'b';
      break;
    case '\n':
      result[resultIndex++] = '\\';
      result[resultIndex++] = 'n';
      break;
    case '\r':
      result[resultIndex++] = '\\';
      result[resultIndex++] = 'r';
      break;
    case '\t':
      result[resultIndex++] = '\\';
      result[resultIndex++] = 't';
      break;
    case '\v':
      result[resultIndex++] = '\\';
      result[resultIndex++] = 'v';
      break;
    case '\"':
    case '\'':
    case '\\':
    case '\?':
      result[resultIndex++] = '\\';
      result[resultIndex++] = s[i];
      break;
    default:
      result[resultIndex++] = s[i];
    }
  }
  result[resultIndex++] = '\"';
  result[resultIndex] = '\0';

  return (string){resultIndex, result};
}

static inline string showCharPointer(char *s) {
  return showString(strCharPointer(s));
}

static inline string showInt(int i) {
  char *result = GC_malloc((8 * sizeof(i) - 1) / 3 + 2);
  sprintf(result, "%d", i);
  return (string){strlen(result), result};
}

static inline string showFloat(double f) {
  char *result = GC_malloc((8 * sizeof(f) - 1) / 3 + 2);
  sprintf((char*)result, "%g", f);
  return (string){strlen(result), result};
}

static inline string showChar(char c) {
  char *result = GC_malloc(4);
  sprintf((char*)result, "'%c'", c);
  return (string){strlen(result), result};
}

static inline string _showPointer(const char *baseTypeName, void *ptr) {
  char *result = GC_malloc(strlen(baseTypeName) + 17);
  sprintf(result, "<%s at 0x%lx>", baseTypeName, (unsigned long)ptr);
  return (string){strlen(result), result};
}
# 2 "../../../extensions/ableC-lvars/include/lvars.xh" 2



# 1 "/usr/include/pthread.h" 1 3 4
# 22 "/usr/include/pthread.h" 3 4
# 1 "/usr/include/endian.h" 1 3 4
# 36 "/usr/include/endian.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/endian.h" 1 3 4
# 37 "/usr/include/endian.h" 2 3 4
# 23 "/usr/include/pthread.h" 2 3 4
# 1 "/usr/include/sched.h" 1 3 4
# 28 "/usr/include/sched.h" 3 4
# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stddef.h" 1 3 4
# 29 "/usr/include/sched.h" 2 3 4





# 1 "/usr/include/time.h" 1 3 4
# 29 "/usr/include/time.h" 3 4








# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stddef.h" 1 3 4
# 38 "/usr/include/time.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/time.h" 1 3 4
# 55 "/usr/include/x86_64-linux-gnu/bits/time.h" 3 4
extern long int __sysconf (int);
# 42 "/usr/include/time.h" 2 3 4
# 57 "/usr/include/time.h" 3 4


typedef __clock_t clock_t;



# 73 "/usr/include/time.h" 3 4


typedef __time_t time_t;



# 120 "/usr/include/time.h" 3 4
struct timespec
  {
    __time_t tv_sec;
    __syscall_slong_t tv_nsec;
  };








struct tm
{
  int tm_sec;
  int tm_min;
  int tm_hour;
  int tm_mday;
  int tm_mon;
  int tm_year;
  int tm_wday;
  int tm_yday;
  int tm_isdst;





  long int __tm_gmtoff;
  const char *__tm_zone;

};



# 186 "/usr/include/time.h" 3 4



extern clock_t clock (void) __attribute__ ((__nothrow__ , __leaf__));


extern time_t time (time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));


extern double difftime (time_t __time1, time_t __time0)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern time_t mktime (struct tm *__tp) __attribute__ ((__nothrow__ , __leaf__));





extern size_t strftime (char *__restrict __s, size_t __maxsize,
   const char *__restrict __format,
   const struct tm *__restrict __tp) __attribute__ ((__nothrow__ , __leaf__));

# 236 "/usr/include/time.h" 3 4



extern struct tm *gmtime (const time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));



extern struct tm *localtime (const time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));





extern struct tm *gmtime_r (const time_t *__restrict __timer,
       struct tm *__restrict __tp) __attribute__ ((__nothrow__ , __leaf__));



extern struct tm *localtime_r (const time_t *__restrict __timer,
          struct tm *__restrict __tp) __attribute__ ((__nothrow__ , __leaf__));





extern char *asctime (const struct tm *__tp) __attribute__ ((__nothrow__ , __leaf__));


extern char *ctime (const time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));







extern char *asctime_r (const struct tm *__restrict __tp,
   char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));


extern char *ctime_r (const time_t *__restrict __timer,
        char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));




extern char *__tzname[2];
extern int __daylight;
extern long int __timezone;




extern char *tzname[2];



extern void tzset (void) __attribute__ ((__nothrow__ , __leaf__));
# 386 "/usr/include/time.h" 3 4
extern int timespec_get (struct timespec *__ts, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 430 "/usr/include/time.h" 3 4

# 35 "/usr/include/sched.h" 2 3 4


typedef __pid_t pid_t;





# 1 "/usr/include/x86_64-linux-gnu/bits/sched.h" 1 3 4
# 72 "/usr/include/x86_64-linux-gnu/bits/sched.h" 3 4
struct sched_param
  {
    int __sched_priority;
  };


# 95 "/usr/include/x86_64-linux-gnu/bits/sched.h" 3 4








struct __sched_param
  {
    int __sched_priority;
  };
# 118 "/usr/include/x86_64-linux-gnu/bits/sched.h" 3 4
typedef unsigned long int __cpu_mask;






typedef struct
{
  __cpu_mask __bits[1024 / (8 * sizeof (__cpu_mask))];
} cpu_set_t;
# 201 "/usr/include/x86_64-linux-gnu/bits/sched.h" 3 4


extern int __sched_cpucount (size_t __setsize, const cpu_set_t *__setp)
  __attribute__ ((__nothrow__ , __leaf__));
extern cpu_set_t *__sched_cpualloc (size_t __count) __attribute__ ((__nothrow__ , __leaf__)) ;
extern void __sched_cpufree (cpu_set_t *__set) __attribute__ ((__nothrow__ , __leaf__));


# 44 "/usr/include/sched.h" 2 3 4







extern int sched_setparam (__pid_t __pid, const struct sched_param *__param)
     __attribute__ ((__nothrow__ , __leaf__));


extern int sched_getparam (__pid_t __pid, struct sched_param *__param) __attribute__ ((__nothrow__ , __leaf__));


extern int sched_setscheduler (__pid_t __pid, int __policy,
          const struct sched_param *__param) __attribute__ ((__nothrow__ , __leaf__));


extern int sched_getscheduler (__pid_t __pid) __attribute__ ((__nothrow__ , __leaf__));


extern int sched_yield (void) __attribute__ ((__nothrow__ , __leaf__));


extern int sched_get_priority_max (int __algorithm) __attribute__ ((__nothrow__ , __leaf__));


extern int sched_get_priority_min (int __algorithm) __attribute__ ((__nothrow__ , __leaf__));


extern int sched_rr_get_interval (__pid_t __pid, struct timespec *__t) __attribute__ ((__nothrow__ , __leaf__));
# 126 "/usr/include/sched.h" 3 4

# 24 "/usr/include/pthread.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 1 3 4
# 21 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 2 3 4
# 60 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
typedef unsigned long int pthread_t;


union pthread_attr_t
{
  char __size[56];
  long int __align;
};

typedef union pthread_attr_t pthread_attr_t;





typedef struct __pthread_internal_list
{
  struct __pthread_internal_list *__prev;
  struct __pthread_internal_list *__next;
} __pthread_list_t;
# 90 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
typedef union
{
  struct __pthread_mutex_s
  {
    int __lock;
    unsigned int __count;
    int __owner;

    unsigned int __nusers;



    int __kind;

    short __spins;
    short __elision;
    __pthread_list_t __list;
# 125 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
  } __data;
  char __size[40];
  long int __align;
} pthread_mutex_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_mutexattr_t;




typedef union
{
  struct
  {
    int __lock;
    unsigned int __futex;
    __extension__ unsigned long long int __total_seq;
    __extension__ unsigned long long int __wakeup_seq;
    __extension__ unsigned long long int __woken_seq;
    void *__mutex;
    unsigned int __nwaiters;
    unsigned int __broadcast_seq;
  } __data;
  char __size[48];
  __extension__ long long int __align;
} pthread_cond_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_condattr_t;



typedef unsigned int pthread_key_t;



typedef int pthread_once_t;
# 27 "/usr/include/pthread.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/setjmp.h" 1 3 4
# 26 "/usr/include/x86_64-linux-gnu/bits/setjmp.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/bits/setjmp.h" 2 3 4




typedef long int __jmp_buf[8];
# 28 "/usr/include/pthread.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 29 "/usr/include/pthread.h" 2 3 4



enum
{
  PTHREAD_CREATE_JOINABLE,

  PTHREAD_CREATE_DETACHED

};



enum
{
  PTHREAD_MUTEX_TIMED_NP,
  PTHREAD_MUTEX_RECURSIVE_NP,
  PTHREAD_MUTEX_ERRORCHECK_NP,
  PTHREAD_MUTEX_ADAPTIVE_NP
# 59 "/usr/include/pthread.h" 3 4
};
# 155 "/usr/include/pthread.h" 3 4
enum
{
  PTHREAD_INHERIT_SCHED,

  PTHREAD_EXPLICIT_SCHED

};



enum
{
  PTHREAD_SCOPE_SYSTEM,

  PTHREAD_SCOPE_PROCESS

};



enum
{
  PTHREAD_PROCESS_PRIVATE,

  PTHREAD_PROCESS_SHARED

};
# 190 "/usr/include/pthread.h" 3 4
struct _pthread_cleanup_buffer
{
  void (*__routine) (void *);
  void *__arg;
  int __canceltype;
  struct _pthread_cleanup_buffer *__prev;
};


enum
{
  PTHREAD_CANCEL_ENABLE,

  PTHREAD_CANCEL_DISABLE

};
enum
{
  PTHREAD_CANCEL_DEFERRED,

  PTHREAD_CANCEL_ASYNCHRONOUS

};
# 228 "/usr/include/pthread.h" 3 4





extern int pthread_create (pthread_t *__restrict __newthread,
      const pthread_attr_t *__restrict __attr,
      void *(*__start_routine) (void *),
      void *__restrict __arg) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 3)));





extern void pthread_exit (void *__retval) __attribute__ ((__noreturn__));







extern int pthread_join (pthread_t __th, void **__thread_return);
# 271 "/usr/include/pthread.h" 3 4
extern int pthread_detach (pthread_t __th) __attribute__ ((__nothrow__ , __leaf__));



extern pthread_t pthread_self (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int pthread_equal (pthread_t __thread1, pthread_t __thread2)
  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));







extern int pthread_attr_init (pthread_attr_t *__attr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_destroy (pthread_attr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_getdetachstate (const pthread_attr_t *__attr,
     int *__detachstate)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setdetachstate (pthread_attr_t *__attr,
     int __detachstate)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_attr_getguardsize (const pthread_attr_t *__attr,
          size_t *__guardsize)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setguardsize (pthread_attr_t *__attr,
          size_t __guardsize)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_attr_getschedparam (const pthread_attr_t *__restrict __attr,
           struct sched_param *__restrict __param)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setschedparam (pthread_attr_t *__restrict __attr,
           const struct sched_param *__restrict
           __param) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_getschedpolicy (const pthread_attr_t *__restrict
     __attr, int *__restrict __policy)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setschedpolicy (pthread_attr_t *__attr, int __policy)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_getinheritsched (const pthread_attr_t *__restrict
      __attr, int *__restrict __inherit)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setinheritsched (pthread_attr_t *__attr,
      int __inherit)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_attr_getscope (const pthread_attr_t *__restrict __attr,
      int *__restrict __scope)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setscope (pthread_attr_t *__attr, int __scope)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_getstackaddr (const pthread_attr_t *__restrict
          __attr, void **__restrict __stackaddr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2))) __attribute__ ((__deprecated__));





extern int pthread_attr_setstackaddr (pthread_attr_t *__attr,
          void *__stackaddr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) __attribute__ ((__deprecated__));


extern int pthread_attr_getstacksize (const pthread_attr_t *__restrict
          __attr, size_t *__restrict __stacksize)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));




extern int pthread_attr_setstacksize (pthread_attr_t *__attr,
          size_t __stacksize)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 429 "/usr/include/pthread.h" 3 4
extern int pthread_setschedparam (pthread_t __target_thread, int __policy,
      const struct sched_param *__param)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));


extern int pthread_getschedparam (pthread_t __target_thread,
      int *__restrict __policy,
      struct sched_param *__restrict __param)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));


extern int pthread_setschedprio (pthread_t __target_thread, int __prio)
     __attribute__ ((__nothrow__ , __leaf__));
# 494 "/usr/include/pthread.h" 3 4
extern int pthread_once (pthread_once_t *__once_control,
    void (*__init_routine) (void)) __attribute__ ((__nonnull__ (1, 2)));
# 506 "/usr/include/pthread.h" 3 4
extern int pthread_setcancelstate (int __state, int *__oldstate);



extern int pthread_setcanceltype (int __type, int *__oldtype);


extern int pthread_cancel (pthread_t __th);




extern void pthread_testcancel (void);




typedef struct
{
  struct
  {
    __jmp_buf __cancel_jmp_buf;
    int __mask_was_saved;
  } __cancel_jmp_buf[1];
  void *__pad[4];
} __pthread_unwind_buf_t __attribute__ ((__aligned__));
# 540 "/usr/include/pthread.h" 3 4
struct __pthread_cleanup_frame
{
  void (*__cancel_routine) (void *);
  void *__cancel_arg;
  int __do_it;
  int __cancel_type;
};
# 680 "/usr/include/pthread.h" 3 4
extern void __pthread_register_cancel (__pthread_unwind_buf_t *__buf)
     ;
# 692 "/usr/include/pthread.h" 3 4
extern void __pthread_unregister_cancel (__pthread_unwind_buf_t *__buf)
  ;
# 733 "/usr/include/pthread.h" 3 4
extern void __pthread_unwind_next (__pthread_unwind_buf_t *__buf)
     __attribute__ ((__noreturn__))

     __attribute__ ((__weak__))

     ;



struct __jmp_buf_tag;
extern int __sigsetjmp (struct __jmp_buf_tag *__env, int __savemask) __attribute__ ((__nothrow__));





extern int pthread_mutex_init (pthread_mutex_t *__mutex,
          const pthread_mutexattr_t *__mutexattr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_mutex_destroy (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_mutex_trylock (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_mutex_lock (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));
# 773 "/usr/include/pthread.h" 3 4
extern int pthread_mutex_unlock (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_mutex_getprioceiling (const pthread_mutex_t *
      __restrict __mutex,
      int *__restrict __prioceiling)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_mutex_setprioceiling (pthread_mutex_t *__restrict __mutex,
      int __prioceiling,
      int *__restrict __old_ceiling)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3)));
# 806 "/usr/include/pthread.h" 3 4
extern int pthread_mutexattr_init (pthread_mutexattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_mutexattr_destroy (pthread_mutexattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_mutexattr_getpshared (const pthread_mutexattr_t *
      __restrict __attr,
      int *__restrict __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_mutexattr_setpshared (pthread_mutexattr_t *__attr,
      int __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 838 "/usr/include/pthread.h" 3 4
extern int pthread_mutexattr_getprotocol (const pthread_mutexattr_t *
       __restrict __attr,
       int *__restrict __protocol)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_mutexattr_setprotocol (pthread_mutexattr_t *__attr,
       int __protocol)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_mutexattr_getprioceiling (const pthread_mutexattr_t *
          __restrict __attr,
          int *__restrict __prioceiling)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_mutexattr_setprioceiling (pthread_mutexattr_t *__attr,
          int __prioceiling)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 968 "/usr/include/pthread.h" 3 4
extern int pthread_cond_init (pthread_cond_t *__restrict __cond,
         const pthread_condattr_t *__restrict __cond_attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_cond_destroy (pthread_cond_t *__cond)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_cond_signal (pthread_cond_t *__cond)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_cond_broadcast (pthread_cond_t *__cond)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));






extern int pthread_cond_wait (pthread_cond_t *__restrict __cond,
         pthread_mutex_t *__restrict __mutex)
     __attribute__ ((__nonnull__ (1, 2)));
# 1000 "/usr/include/pthread.h" 3 4
extern int pthread_cond_timedwait (pthread_cond_t *__restrict __cond,
       pthread_mutex_t *__restrict __mutex,
       const struct timespec *__restrict __abstime)
     __attribute__ ((__nonnull__ (1, 2, 3)));




extern int pthread_condattr_init (pthread_condattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_condattr_destroy (pthread_condattr_t *__attr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_condattr_getpshared (const pthread_condattr_t *
     __restrict __attr,
     int *__restrict __pshared)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_condattr_setpshared (pthread_condattr_t *__attr,
     int __pshared) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 1111 "/usr/include/pthread.h" 3 4
extern int pthread_key_create (pthread_key_t *__key,
          void (*__destr_function) (void *))
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_key_delete (pthread_key_t __key) __attribute__ ((__nothrow__ , __leaf__));


extern void *pthread_getspecific (pthread_key_t __key) __attribute__ ((__nothrow__ , __leaf__));


extern int pthread_setspecific (pthread_key_t __key,
    const void *__pointer) __attribute__ ((__nothrow__ , __leaf__)) ;
# 1145 "/usr/include/pthread.h" 3 4
extern int pthread_atfork (void (*__prepare) (void),
      void (*__parent) (void),
      void (*__child) (void)) __attribute__ ((__nothrow__ , __leaf__));
# 1159 "/usr/include/pthread.h" 3 4

# 6 "../../../extensions/ableC-lvars/include/lvars.xh" 2
# 1 "/usr/include/errno.h" 1 3 4
# 31 "/usr/include/errno.h" 3 4




# 1 "/usr/include/x86_64-linux-gnu/bits/errno.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/errno.h" 3 4
# 1 "/usr/include/linux/errno.h" 1 3 4
# 1 "/usr/include/x86_64-linux-gnu/asm/errno.h" 1 3 4
# 1 "/usr/include/asm-generic/errno.h" 1 3 4



# 1 "/usr/include/asm-generic/errno-base.h" 1 3 4
# 5 "/usr/include/asm-generic/errno.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/asm/errno.h" 2 3 4
# 1 "/usr/include/linux/errno.h" 2 3 4
# 25 "/usr/include/x86_64-linux-gnu/bits/errno.h" 2 3 4
# 50 "/usr/include/x86_64-linux-gnu/bits/errno.h" 3 4
extern int *__errno_location (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
# 36 "/usr/include/errno.h" 2 3 4
# 58 "/usr/include/errno.h" 3 4

# 7 "../../../extensions/ableC-lvars/include/lvars.xh" 2
# 1 "/usr/include/x86_64-linux-gnu/sys/time.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/sys/time.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/time.h" 1 3 4
# 30 "/usr/include/x86_64-linux-gnu/bits/time.h" 3 4
struct timeval
  {
    __time_t tv_sec;
    __suseconds_t tv_usec;
  };
# 28 "/usr/include/x86_64-linux-gnu/sys/time.h" 2 3 4

# 1 "/usr/include/x86_64-linux-gnu/sys/select.h" 1 3 4
# 30 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/select.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/select.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/select.h" 2 3 4
# 31 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/sigset.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/sigset.h" 3 4
typedef int __sig_atomic_t;




typedef struct
  {
    unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
  } __sigset_t;
# 34 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4



typedef __sigset_t sigset_t;







# 1 "/usr/include/x86_64-linux-gnu/bits/time.h" 1 3 4
# 46 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4


typedef __suseconds_t suseconds_t;





typedef long int __fd_mask;
# 64 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
typedef struct
  {






    __fd_mask __fds_bits[1024 / (8 * (int) sizeof (__fd_mask))];


  } fd_set;
# 96 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4

# 106 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
extern int select (int __nfds, fd_set *__restrict __readfds,
     fd_set *__restrict __writefds,
     fd_set *__restrict __exceptfds,
     struct timeval *__restrict __timeout);
# 131 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4

# 30 "/usr/include/x86_64-linux-gnu/sys/time.h" 2 3 4








# 63 "/usr/include/x86_64-linux-gnu/sys/time.h" 3 4
typedef void *__restrict __timezone_ptr_t;







extern int gettimeofday (struct timeval *__restrict __tv,
    __timezone_ptr_t __tz) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 91 "/usr/include/x86_64-linux-gnu/sys/time.h" 3 4
enum __itimer_which
  {

    ITIMER_REAL = 0,


    ITIMER_VIRTUAL = 1,



    ITIMER_PROF = 2

  };



struct itimerval
  {

    struct timeval it_interval;

    struct timeval it_value;
  };






typedef int __itimer_which_t;




extern int getitimer (__itimer_which_t __which,
        struct itimerval *__value) __attribute__ ((__nothrow__ , __leaf__));




extern int setitimer (__itimer_which_t __which,
        const struct itimerval *__restrict __new,
        struct itimerval *__restrict __old) __attribute__ ((__nothrow__ , __leaf__));




extern int utimes (const char *__file, const struct timeval __tvp[2])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 189 "/usr/include/x86_64-linux-gnu/sys/time.h" 3 4

# 8 "../../../extensions/ableC-lvars/include/lvars.xh" 2
# 26 "../../../extensions/ableC-lvars/include/lvars.xh"
int _lvarCheckValue = 1;



template<a> struct _Lattice {
  a _bottom;
  a _top;
  int (*_leq)();
  a (* _lub)();
  int (*_eq)();
  string (*_show)();
};



template<a>
static Lattice<a>* _newLattice(a least, a greatest, int (*leq)(),
                               a (*lub)(), int (*eq)(), string (*showMethod)()) {
  Lattice<a> * l = malloc(sizeof(Lattice<a>));
  l->_bottom = least;
  l->_top = greatest;
  l->_leq = leq;
  l-> _lub = lub;
  l->_eq = eq;
  l->_show = showMethod;
  return l;
}



template<a> struct _ActivationSet {
  int _size;
  a* _set;
  int _index;
  Lattice<a>* _lattice;
};



template<a>
static ActivationSet<a>* _newActivationSet(Lattice<a>* l, int size) {
# 81 "../../../extensions/ableC-lvars/include/lvars.xh"
  ActivationSet<a> * act = malloc(sizeof(ActivationSet<a>));
  act->_size = size;
  act->_set = malloc(sizeof(a) * size);
  act->_index = 0;
  act ->_lattice = l;
  return act;
}



template<a>
static string _showActivation(ActivationSet<a>* act){
  string result = str("{");

  int i = 0;
  for (; i < act->_index - 1; i++) {
    result += act ->_lattice->_show(act->_set[i]) + ", ";
  }
  for (; i < act->_index; i++) {
    result += act ->_lattice->_show(act->_set[i]);
  }

  return result + "}";
}



template<a>
static ActivationSet<a>* _addAct(ActivationSet<a>* act, a element) {
  if (act->_index >= act->_size) {
     inst _resizeActSet<a>(act, 2 * act->_size + 1);
  }
  act->_set[act->_index] = element;
  act->_index++;
  return act;
}



template<a>
static int _resizeActSet(ActivationSet<a>* act, int newSize) {
  a* newSet = malloc(sizeof(a*) * newSize);
  for (int i = 0; i < act->_size; i++) {
    newSet[i] = act->_set[i];
  }
  free(act->_set);
  act->_set = newSet;
  act->_size = newSize;
  return 1;
}


template<a>
static int _freeActivation(ActivationSet<a>* act) {
  free(act->_set);
  free(act);
  return 1;
}



template<a> struct _ThresholdSet {
  Lattice<a>* _lattice;
  int _size;
  int _index;
  ActivationSet<a> ** _a_sets;
};



template<a>
static ThresholdSet<a>* _newThresholdSet(Lattice<a> * l, int size) {
# 166 "../../../extensions/ableC-lvars/include/lvars.xh"
  ThresholdSet<a> * t = malloc(sizeof(ThresholdSet<a>));
  t ->_lattice = l;
  t->_size = size;
  t->_index = 0;
  t->_a_sets = malloc(sizeof(ActivationSet<a>*) * size);
  return t;
}



template<a>
static int _incompat(Lattice<a> * l, ActivationSet<a> *Q, ActivationSet<a> *R) {
# 186 "../../../extensions/ableC-lvars/include/lvars.xh"
  if (Q -> _lattice != l || R -> _lattice != l) {
    return 0;
  }

  for (int i = 0; i < Q->_index; i++) {
    for (int j = 0; j < R->_index; j++) {
      a q = Q->_set[i];
      a r = R->_set[j];
      if (!(l->_eq(l->_lub(q, r), l->_top))) {





        return 0;
      }
    }
  }
  return 1;
}





template<a>
static ThresholdSet<a>* _addThreshold(ThresholdSet<a>* t, ActivationSet<a>* act) {
# 227 "../../../extensions/ableC-lvars/include/lvars.xh"
  if (t->_index >= t->_size) {
     inst _resizeThresholdSet<a>(t, 2 * t->_size + 1);
  }
# 239 "../../../extensions/ableC-lvars/include/lvars.xh"
  t->_a_sets[t->_index] = act;
  t->_index++;
  return t;
}



template<a>
static int _resizeThresholdSet(ThresholdSet<a>* t, int newSize) {
 ActivationSet<a>** newSet = malloc(sizeof(ActivationSet<a>*) * newSize);
 for (int i = 0; i < t->_index; i++) {
   newSet[i] = t->_a_sets[i];
 }

 free(t->_a_sets);
 t->_a_sets= newSet;
 t->_size = newSize;
 return 1;
}



template<a>
static int _freeThreshold(ThresholdSet<a> *t) {
  free(t->_a_sets);
  free(t);
  return 1;
}



template<a>
static string _showThreshold(ThresholdSet<a>* t){
  string result = str("{");
  int i = 0;
  for (; i < t->_index - 1; i++) {
    result += show(t->_a_sets[i]) + ", ";
  }
  for (; i < t->_index; i++) {
    result += show(t->_a_sets[i]);
  }
  return result + "}";
}



template<a> struct _Lvar {
  Lattice<a> * _lattice;
  a _value;
  int _frozen;
  ThresholdSet<a> * _threshold;
  pthread_mutex_t _mutex;
  pthread_cond_t _cond;
};

template<a>
static string _showLvar(Lvar<a>* l) {
  if (l->_frozen) {
    return l->_lattice->_show(l->_value);
  }






  return str("<Lvar Value Unavailable>");
}





template<a>
static Lvar<a>* _new(Lattice<a>* l) {
  Lvar<a>* lvarNew = malloc(sizeof(Lvar<a>));
  lvarNew->_value = l-> _bottom;
  lvarNew-> _lattice = l;
  lvarNew-> _frozen = 0;
  lvarNew->_cond = (pthread_cond_t) { { 0, 0, 0, 0, 0, (void *) 0, 0, 0 } };
  lvarNew->_mutex = (pthread_mutex_t) { { 0, 0, 0, 0, 0, 0, 0, { 0, 0 } } };
  return lvarNew;
}







template<a>
static int _put(Lvar<a>* l, a newState) {

  pthread_mutex_lock(&(l->_mutex));

  if (l->_frozen) {




    pthread_mutex_unlock(&(l->_mutex));
    return 0;
  }

  a oldState = l->_value;
  a newValue = l-> _lattice-> _lub(oldState, newState);

  if (l-> _lattice->_eq(l->_lattice->_top, newValue)){
# 357 "../../../extensions/ableC-lvars/include/lvars.xh"
  }
  l->_value = newValue;

  pthread_mutex_unlock(&(l->_mutex));
  pthread_cond_broadcast(&(l->_cond));

  return 1;
}





template<a>
static ActivationSet<a>* _thresholdReached(Lvar<a>* l, ThresholdSet<a> * t) {
  for (int i = 0; i < t->_index; i++) {
    for (int j = 0; j < t->_a_sets[i]->_index; j++) {
      if (l-> _lattice->_leq(t->_a_sets[i]->_set[j], l->_value)) {
        return t->_a_sets[i];
      }
    }
  }
  return ((void *)0);
}

template<a>
static ActivationSet<a>* _get(Lvar<a>* l, ThresholdSet<a> * t) {

  pthread_mutex_lock(&(l->_mutex));
# 401 "../../../extensions/ableC-lvars/include/lvars.xh"
  ActivationSet<a>* actReached = inst _thresholdReached<a>(l, t);
  while (actReached == ((void *)0)) {
    if (l->_frozen) {
      pthread_mutex_unlock(&(l->_mutex));
      return ((void *)0);
    }
    pthread_cond_wait(&(l->_cond), &(l->_mutex));
    actReached = inst _thresholdReached<a>(l, t);
  }
  pthread_mutex_unlock(&(l->_mutex));
  return actReached;
}




template<a>
static a _freeze(Lvar<a>* l) {
  pthread_mutex_lock(&(l->_mutex));
  l->_frozen = 1;
  a result = l->_value;
  pthread_mutex_unlock(&(l->_mutex));
  return result;
}
# 2 "positive/and.xc" 2
# 11 "positive/and.xc"
typedef datatype Bl Bl;
datatype Bl {
  T ();
  F ();
  Bot ();
};

typedef datatype State State;
datatype State {
  Top ();
  Pair (Bl*, Bl*);
};



int eqBool(Bl* b1, Bl* b2) {
  match (b1) {
    T() -> {
      match (b2) {
        T() -> {return 1;}
        other -> {return 0;}
      }
    }
    F() -> {
      match (b2) {
        F() -> {return 1;}
        other -> {return 0;}
      }
    }
    Bot() -> {
      match (b2) {
        Bot() -> {return 1;}
        other -> {return 0;}
      }
    }
  }
}

int eq(State* s1, State* s2) {
  match (s1) {
    Top() -> {
      match (s2) {
        Top() -> {return 1;}
        other -> {return 0;}
      }
    }
    Pair(b1, b2) -> {
      match (s2) {
        Pair(b3, b4) -> {return eqBool(b1, b3) && eqBool(b2, b4);}
        other -> {return 0;}
      }
    }
  }
}



int leq(State* s1, State* s2) {
  match (s1) {
    Top() -> {return 0;}
    Pair(Bot(), Bot()) -> {return 1;}
    Pair(b1, Bot()) -> {
      match (s2) {
        Pair(b2, other) -> {return eqBool(b1, b2);}
        Top() -> {return 1;}
      }
    }
    Pair(Bot(), b1) -> {
      match (s2) {
        Pair(other, b2) -> {return eqBool(b1, b2);}
        Top() -> {return 1;}
      }
    }
    Pair(b1, b2) -> {
      match (s2) {
        Top() -> {return 1;}
        Pair(other1, other2) -> {
          return eqBool(b1, other1) && eqBool(b2, other2);
        }
      }
    }
  }
  return 0;
}



State* lub (State* s1, State* s2) {
  match (s1) {
    Top() -> {return Top();}
    Pair(Bot(), Bot()) -> {return s2;}
    Pair(x1, y1) -> {
      match (s2) {
        Top() -> {return Top();}
        Pair(Bot(), Bot()) -> {return s1;}
        Pair(x2, y2) -> {
          Bl* x;
          Bl* y;
          match (x1) {
            Bot() -> {x = x2;}
            other1 -> {
              match (x2) {
                Bot() -> {x = x1;}
                other2 -> {
                  if (eqBool(x1, x2)) {
                    x = x1;
                  }
                  else {
                    return Top();
                  }
                }
              }
            }
          }
          match (y1) {
            Bot() -> {y = y2;}
            other1 -> {
              match (y2) {
                Bot() -> {y = y1;}
                other2 -> {
                  if (eqBool(y1, y2)) {
                    y = y1;
                  }
                  else {
                    return Top();
                  }
                }
              }
            }
          }
          return Pair(x, y);
        }
      }
    }
  }
  return ((void *)0);
}



string showState(State* s) {
  string result;
  match (s) {
    Top() -> {result = str("Top()");}
    Pair(b1, b2) -> {
      result = str("Pair(");
      match (b1) {
        T() -> {result += "T(), ";}
        F() -> {result += "F(), ";}
        Bot() -> {result += "Bot(), ";}
      }
      match (b2) {
        T() -> {result += "T())";}
        F() -> {result += "F())";}
        Bot() -> {result += "Bot())";}
      }
    }
  }
  return result;
}


int main (int argc, char **argv) {

  Lattice<State*>* l = lattice(Pair(Bot(), Bot()), Top(), leq,
                              lub, eq, showState);

  ActivationSet<State*>* fSet = activationSet(l){Pair(F(), F()), Pair(F(), T()),
                                             Pair(T(), F()), Pair(F(), Bot()),
                                             Pair(Bot(), F())};
  printf("fSet: %s\n", show(fSet).text);

  ActivationSet<State*>* tSet = activationSet(l, 1);
  printf("tSet (before adding): %s\n", show(tSet).text);

  add(tSet, Pair(T(), T()));
  printf("tSet: %s\n", show(tSet).text);

  ThresholdSet<State*>* thresh = thresholdSet(l, 2){fSet};
  printf("thresh (before adding): %s\n", show(thresh).text);
  add(thresh, tSet);
  printf("thresh: %s\n", show(thresh).text);

  Lvar<State*>* boolPair1 = newLvar(l);
  put(boolPair1, Pair(T(), Bot()));
  put(boolPair1, Pair(Bot(), T()));
  ActivationSet<State*>* result1 = get(boolPair1, thresh);
  printf("result1: %s\n", show(result1).text);

  Lvar<State*>* boolPair2 = newLvar(l);
  put(boolPair2, Pair(T(), Bot()));
  put(boolPair2, Pair(Bot(), F()));
  ActivationSet<State*>* result2 = get(boolPair2, thresh);
  printf("result2: %s\n", show(result2).text);

  int mainRes;
  if (result1 == tSet && result2 == fSet) {
    mainRes = 1;
  }
  else {
    mainRes = 0;
  }

  free(l);
  freeSet(fSet);
  freeSet(tSet);
  freeSet(thresh);
  free(boolPair1);
  free(boolPair2);
}
