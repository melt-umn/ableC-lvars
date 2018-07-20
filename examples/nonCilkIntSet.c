typedef unsigned long size_t;
extern void  *memcpy(void  *__restrict  __dest, const void  *__restrict  __src, size_t  __n) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1, 2)));
extern void  *memmove(void  * __dest, const void  * __src, size_t  __n) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1, 2)));
extern void  *memset(void  * __s, signed int  __c, size_t  __n) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern signed int memcmp(const void  * __s1, const void  * __s2, size_t  __n) __attribute__((__nothrow__, __leaf__)) __attribute__((__pure__)) __attribute__((__nonnull__(1, 2)));
extern void  *memchr(const void  * __s, signed int  __c, size_t  __n) __attribute__((__nothrow__, __leaf__)) __attribute__((__pure__)) __attribute__((__nonnull__(1)));
extern char  *strcpy(char  *__restrict  __dest, const char  *__restrict  __src) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1, 2)));
extern char  *strncpy(char  *__restrict  __dest, const char  *__restrict  __src, size_t  __n) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1, 2)));
extern char  *strcat(char  *__restrict  __dest, const char  *__restrict  __src) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1, 2)));
extern char  *strncat(char  *__restrict  __dest, const char  *__restrict  __src, size_t  __n) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1, 2)));
extern signed int strcmp(const char  * __s1, const char  * __s2) __attribute__((__nothrow__, __leaf__)) __attribute__((__pure__)) __attribute__((__nonnull__(1, 2)));
extern signed int strncmp(const char  * __s1, const char  * __s2, size_t  __n) __attribute__((__nothrow__, __leaf__)) __attribute__((__pure__)) __attribute__((__nonnull__(1, 2)));
extern signed int strcoll(const char  * __s1, const char  * __s2) __attribute__((__nothrow__, __leaf__)) __attribute__((__pure__)) __attribute__((__nonnull__(1, 2)));
extern size_t strxfrm(char  *__restrict  __dest, const char  *__restrict  __src, size_t  __n) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(2)));
extern char  *strchr(const char  * __s, signed int  __c) __attribute__((__nothrow__, __leaf__)) __attribute__((__pure__)) __attribute__((__nonnull__(1)));
extern char  *strrchr(const char  * __s, signed int  __c) __attribute__((__nothrow__, __leaf__)) __attribute__((__pure__)) __attribute__((__nonnull__(1)));
extern size_t strcspn(const char  * __s, const char  * __reject) __attribute__((__nothrow__, __leaf__)) __attribute__((__pure__)) __attribute__((__nonnull__(1, 2)));
extern size_t strspn(const char  * __s, const char  * __accept) __attribute__((__nothrow__, __leaf__)) __attribute__((__pure__)) __attribute__((__nonnull__(1, 2)));
extern char  *strpbrk(const char  * __s, const char  * __accept) __attribute__((__nothrow__, __leaf__)) __attribute__((__pure__)) __attribute__((__nonnull__(1, 2)));
extern char  *strstr(const char  * __haystack, const char  * __needle) __attribute__((__nothrow__, __leaf__)) __attribute__((__pure__)) __attribute__((__nonnull__(1, 2)));
extern char  *strtok(char  *__restrict  __s, const char  *__restrict  __delim) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(2)));
extern char  *__strtok_r(char  *__restrict  __s, const char  *__restrict  __delim, char  * *__restrict  __save_ptr) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(2, 3)));
extern char  *strtok_r(char  *__restrict  __s, const char  *__restrict  __delim, char  * *__restrict  __save_ptr) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(2, 3)));
extern size_t strlen(const char  * __s) __attribute__((__nothrow__, __leaf__)) __attribute__((__pure__)) __attribute__((__nonnull__(1)));
extern char  *strerror(signed int  __errnum) __attribute__((__nothrow__, __leaf__));
extern void __bzero(void  * __s, size_t  __n) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
typedef unsigned char __u_char;
typedef unsigned short __u_short;
typedef unsigned int __u_int;
typedef unsigned long __u_long;
typedef char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short __int16_t;
typedef unsigned short __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;
typedef signed long __int64_t;
typedef unsigned long __uint64_t;
typedef signed long __quad_t;
typedef unsigned long __u_quad_t;
typedef unsigned long __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long __ino_t;
typedef unsigned long __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long __nlink_t;
typedef signed long __off_t;
typedef signed long __off64_t;
typedef signed int __pid_t;
typedef struct  {
  signed int __val[2];
  
} __fsid_t;
typedef signed long __clock_t;
typedef unsigned long __rlim_t;
typedef unsigned long __rlim64_t;
typedef unsigned int __id_t;
typedef signed long __time_t;
typedef unsigned int __useconds_t;
typedef signed long __suseconds_t;
typedef signed int __daddr_t;
typedef signed int __key_t;
typedef signed int __clockid_t;
typedef void  *__timer_t;
typedef signed long __blksize_t;
typedef signed long __blkcnt_t;
typedef signed long __blkcnt64_t;
typedef unsigned long __fsblkcnt_t;
typedef unsigned long __fsblkcnt64_t;
typedef unsigned long __fsfilcnt_t;
typedef unsigned long __fsfilcnt64_t;
typedef signed long __fsword_t;
typedef signed long __ssize_t;
typedef signed long __syscall_slong_t;
typedef unsigned long __syscall_ulong_t;
typedef __off64_t __loff_t;
typedef __quad_t  *__qaddr_t;
typedef char  *__caddr_t;
typedef signed long __intptr_t;
typedef unsigned int __socklen_t;
struct _IO_FILE;
typedef struct _IO_FILE FILE;
typedef struct _IO_FILE __FILE;
typedef struct  {
  signed int __count;
  union  {
    unsigned int __wch;
    char __wchb[4];
    
  } __value;
  
} __mbstate_t;
typedef struct  {
  __off_t __pos;
  __mbstate_t __state;
  
} _G_fpos_t;
typedef struct  {
  __off64_t __pos;
  __mbstate_t __state;
  
} _G_fpos64_t;
typedef __builtin_va_list __gnuc_va_list;
struct _IO_jump_t;
struct _IO_FILE;
typedef void _IO_lock_t;
struct _IO_marker {
  struct _IO_marker  *_next;
  struct _IO_FILE  *_sbuf;
  signed int _pos;
  
};
enum __codecvt_result {
  __codecvt_ok,
  __codecvt_partial,
  __codecvt_error,
  __codecvt_noconv
};
struct _IO_FILE {
  signed int _flags;
  char  *_IO_read_ptr;
  char  *_IO_read_end;
  char  *_IO_read_base;
  char  *_IO_write_base;
  char  *_IO_write_ptr;
  char  *_IO_write_end;
  char  *_IO_buf_base;
  char  *_IO_buf_end;
  char  *_IO_save_base;
  char  *_IO_backup_base;
  char  *_IO_save_end;
  struct _IO_marker  *_markers;
  struct _IO_FILE  *_chain;
  signed int _fileno;
  signed int _flags2;
  __off_t _old_offset;
  unsigned short _cur_column;
  char _vtable_offset;
  char _shortbuf[1];
  _IO_lock_t  *_lock;
  __off64_t _offset;
  void  *__pad1;
  void  *__pad2;
  void  *__pad3;
  void  *__pad4;
  size_t __pad5;
  signed int _mode;
  char _unused2[(((15 * (sizeof(signed int))) - (4 * (sizeof(void *)))) - (sizeof(size_t)))];
  
};
typedef struct _IO_FILE _IO_FILE;
struct _IO_FILE_plus;
extern struct _IO_FILE_plus _IO_2_1_stdin_;
extern struct _IO_FILE_plus _IO_2_1_stdout_;
extern struct _IO_FILE_plus _IO_2_1_stderr_;
typedef __ssize_t __io_read_fn(void  * __cookie, char  * __buf, size_t  __nbytes);
typedef __ssize_t __io_write_fn(void  * __cookie, const char  * __buf, size_t  __n);
typedef signed int __io_seek_fn(void  * __cookie, __off64_t  * __pos, signed int  __w);
typedef signed int __io_close_fn(void  * __cookie);
extern signed int __underflow(_IO_FILE  * );
extern signed int __uflow(_IO_FILE  * );
extern signed int __overflow(_IO_FILE  * , signed int  );
extern signed int _IO_getc(_IO_FILE  * __fp);
extern signed int _IO_putc(signed int  __c, _IO_FILE  * __fp);
extern signed int _IO_feof(_IO_FILE  * __fp) __attribute__((__nothrow__, __leaf__));
extern signed int _IO_ferror(_IO_FILE  * __fp) __attribute__((__nothrow__, __leaf__));
extern signed int _IO_peekc_locked(_IO_FILE  * __fp);
extern void _IO_flockfile(_IO_FILE  * ) __attribute__((__nothrow__, __leaf__));
extern void _IO_funlockfile(_IO_FILE  * ) __attribute__((__nothrow__, __leaf__));
extern signed int _IO_ftrylockfile(_IO_FILE  * ) __attribute__((__nothrow__, __leaf__));
extern signed int _IO_vfscanf(_IO_FILE  *__restrict  , const char  *__restrict  , __gnuc_va_list  , signed int  *__restrict  );
extern signed int _IO_vfprintf(_IO_FILE  *__restrict  , const char  *__restrict  , __gnuc_va_list  );
extern __ssize_t _IO_padn(_IO_FILE  * , signed int  , __ssize_t  );
extern size_t _IO_sgetn(_IO_FILE  * , void  * , size_t  );
extern __off64_t _IO_seekoff(_IO_FILE  * , __off64_t  , signed int  , signed int  );
extern __off64_t _IO_seekpos(_IO_FILE  * , __off64_t  , signed int  );
extern void _IO_free_backup_area(_IO_FILE  * ) __attribute__((__nothrow__, __leaf__));
typedef _G_fpos_t fpos_t;
extern struct _IO_FILE  *stdin;
extern struct _IO_FILE  *stdout;
extern struct _IO_FILE  *stderr;
extern signed int remove(const char  * __filename) __attribute__((__nothrow__, __leaf__));
extern signed int rename(const char  * __old, const char  * __new) __attribute__((__nothrow__, __leaf__));
extern FILE  *tmpfile(void);
extern char  *tmpnam(char  * __s) __attribute__((__nothrow__, __leaf__));
extern signed int fclose(FILE  * __stream);
extern signed int fflush(FILE  * __stream);
extern FILE  *fopen(const char  *__restrict  __filename, const char  *__restrict  __modes);
extern FILE  *freopen(const char  *__restrict  __filename, const char  *__restrict  __modes, FILE  *__restrict  __stream);
extern FILE  *fdopen(signed int  __fd, const char  * __modes) __attribute__((__nothrow__, __leaf__));
extern void setbuf(FILE  *__restrict  __stream, char  *__restrict  __buf) __attribute__((__nothrow__, __leaf__));
extern signed int setvbuf(FILE  *__restrict  __stream, char  *__restrict  __buf, signed int  __modes, size_t  __n) __attribute__((__nothrow__, __leaf__));
extern signed int fprintf(FILE  *__restrict  __stream, const char  *__restrict  __format, ...);
extern signed int printf(const char  *__restrict  __format, ...);
extern signed int sprintf(char  *__restrict  __s, const char  *__restrict  __format, ...) __attribute__((__nothrow__));
extern signed int vfprintf(FILE  *__restrict  __s, const char  *__restrict  __format, __gnuc_va_list  __arg);
extern signed int vprintf(const char  *__restrict  __format, __gnuc_va_list  __arg);
extern signed int vsprintf(char  *__restrict  __s, const char  *__restrict  __format, __gnuc_va_list  __arg) __attribute__((__nothrow__));
extern signed int snprintf(char  *__restrict  __s, size_t  __maxlen, const char  *__restrict  __format, ...) __attribute__((__nothrow__)) __attribute__((__format__(__printf__, 3, 4)));
extern signed int vsnprintf(char  *__restrict  __s, size_t  __maxlen, const char  *__restrict  __format, __gnuc_va_list  __arg) __attribute__((__nothrow__)) __attribute__((__format__(__printf__, 3, 0)));
extern signed int fscanf(FILE  *__restrict  __stream, const char  *__restrict  __format, ...);
extern signed int scanf(const char  *__restrict  __format, ...);
extern signed int sscanf(const char  *__restrict  __s, const char  *__restrict  __format, ...) __attribute__((__nothrow__, __leaf__));
extern signed int vfscanf(FILE  *__restrict  __s, const char  *__restrict  __format, __gnuc_va_list  __arg) __attribute__((__format__(__scanf__, 2, 0)));
extern signed int vscanf(const char  *__restrict  __format, __gnuc_va_list  __arg) __attribute__((__format__(__scanf__, 1, 0)));
extern signed int vsscanf(const char  *__restrict  __s, const char  *__restrict  __format, __gnuc_va_list  __arg) __attribute__((__nothrow__, __leaf__)) __attribute__((__format__(__scanf__, 2, 0)));
extern signed int fgetc(FILE  * __stream);
extern signed int getc(FILE  * __stream);
extern signed int getchar(void);
extern signed int getc_unlocked(FILE  * __stream);
extern signed int getchar_unlocked(void);
extern signed int fputc(signed int  __c, FILE  * __stream);
extern signed int putc(signed int  __c, FILE  * __stream);
extern signed int putchar(signed int  __c);
extern signed int putc_unlocked(signed int  __c, FILE  * __stream);
extern signed int putchar_unlocked(signed int  __c);
extern char  *fgets(char  *__restrict  __s, signed int  __n, FILE  *__restrict  __stream);
extern signed int fputs(const char  *__restrict  __s, FILE  *__restrict  __stream);
extern signed int puts(const char  * __s);
extern signed int ungetc(signed int  __c, FILE  * __stream);
extern size_t fread(void  *__restrict  __ptr, size_t  __size, size_t  __n, FILE  *__restrict  __stream);
extern size_t fwrite(const void  *__restrict  __ptr, size_t  __size, size_t  __n, FILE  *__restrict  __s);
extern signed int fseek(FILE  * __stream, signed long  __off, signed int  __whence);
extern signed long ftell(FILE  * __stream);
extern void rewind(FILE  * __stream);
extern signed int fgetpos(FILE  *__restrict  __stream, fpos_t  *__restrict  __pos);
extern signed int fsetpos(FILE  * __stream, const fpos_t  * __pos);
extern void clearerr(FILE  * __stream) __attribute__((__nothrow__, __leaf__));
extern signed int feof(FILE  * __stream) __attribute__((__nothrow__, __leaf__));
extern signed int ferror(FILE  * __stream) __attribute__((__nothrow__, __leaf__));
extern void perror(const char  * __s);
extern signed int fileno(FILE  * __stream) __attribute__((__nothrow__, __leaf__));
extern char  *ctermid(char  * __s) __attribute__((__nothrow__, __leaf__));
extern void flockfile(FILE  * __stream) __attribute__((__nothrow__, __leaf__));
extern signed int ftrylockfile(FILE  * __stream) __attribute__((__nothrow__, __leaf__));
extern void funlockfile(FILE  * __stream) __attribute__((__nothrow__, __leaf__));
typedef signed int wchar_t;
typedef struct  {
  signed int quot;
  signed int rem;
  
} div_t;
typedef struct  {
  signed long quot;
  signed long rem;
  
} ldiv_t;
typedef struct  {
  signed long long quot;
  signed long long rem;
  
} lldiv_t;
extern size_t __ctype_get_mb_cur_max(void) __attribute__((__nothrow__, __leaf__));
extern double atof(const char  * __nptr) __attribute__((__nothrow__, __leaf__)) __attribute__((__pure__)) __attribute__((__nonnull__(1)));
extern signed int atoi(const char  * __nptr) __attribute__((__nothrow__, __leaf__)) __attribute__((__pure__)) __attribute__((__nonnull__(1)));
extern signed long atol(const char  * __nptr) __attribute__((__nothrow__, __leaf__)) __attribute__((__pure__)) __attribute__((__nonnull__(1)));
extern signed long long atoll(const char  * __nptr) __attribute__((__nothrow__, __leaf__)) __attribute__((__pure__)) __attribute__((__nonnull__(1)));
extern double strtod(const char  *__restrict  __nptr, char  * *__restrict  __endptr) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern float strtof(const char  *__restrict  __nptr, char  * *__restrict  __endptr) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern long double strtold(const char  *__restrict  __nptr, char  * *__restrict  __endptr) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern signed long strtol(const char  *__restrict  __nptr, char  * *__restrict  __endptr, signed int  __base) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern unsigned long strtoul(const char  *__restrict  __nptr, char  * *__restrict  __endptr, signed int  __base) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern signed long long strtoll(const char  *__restrict  __nptr, char  * *__restrict  __endptr, signed int  __base) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern unsigned long long strtoull(const char  *__restrict  __nptr, char  * *__restrict  __endptr, signed int  __base) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern signed int rand(void) __attribute__((__nothrow__, __leaf__));
extern void srand(unsigned int  __seed) __attribute__((__nothrow__, __leaf__));
extern signed int rand_r(unsigned int  * __seed) __attribute__((__nothrow__, __leaf__));
extern void  *malloc(size_t  __size) __attribute__((__nothrow__, __leaf__)) __attribute__((__malloc__));
extern void  *calloc(size_t  __nmemb, size_t  __size) __attribute__((__nothrow__, __leaf__)) __attribute__((__malloc__));
extern void  *realloc(void  * __ptr, size_t  __size) __attribute__((__nothrow__, __leaf__)) __attribute__((__warn_unused_result__));
extern void free(void  * __ptr) __attribute__((__nothrow__, __leaf__));
extern void  *aligned_alloc(size_t  __alignment, size_t  __size) __attribute__((__nothrow__, __leaf__)) __attribute__((__malloc__)) __attribute__((__alloc_size__(2)));
extern void abort(void) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
extern signed int atexit(void ( * __func)(void)) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern signed int at_quick_exit(void ( * __func)(void)) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern void exit(signed int  __status) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
extern void quick_exit(signed int  __status) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
extern void _Exit(signed int  __status) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
extern char  *getenv(const char  * __name) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern signed int system(const char  * __command);
typedef signed int ( *__compar_fn_t)(const void  * , const void  * );
extern void  *bsearch(const void  * __key, const void  * __base, size_t  __nmemb, size_t  __size, __compar_fn_t  __compar) __attribute__((__nonnull__(1, 2, 5)));
extern void qsort(void  * __base, size_t  __nmemb, size_t  __size, __compar_fn_t  __compar) __attribute__((__nonnull__(1, 4)));
extern signed int abs(signed int  __x) __attribute__((__nothrow__, __leaf__)) __attribute__((__const__));
extern signed long labs(signed long  __x) __attribute__((__nothrow__, __leaf__)) __attribute__((__const__));
extern signed long long llabs(signed long long  __x) __attribute__((__nothrow__, __leaf__)) __attribute__((__const__));
extern div_t div(signed int  __numer, signed int  __denom) __attribute__((__nothrow__, __leaf__)) __attribute__((__const__));
extern ldiv_t ldiv(signed long  __numer, signed long  __denom) __attribute__((__nothrow__, __leaf__)) __attribute__((__const__));
extern lldiv_t lldiv(signed long long  __numer, signed long long  __denom) __attribute__((__nothrow__, __leaf__)) __attribute__((__const__));
extern signed int mblen(const char  * __s, size_t  __n) __attribute__((__nothrow__, __leaf__));
extern signed int mbtowc(wchar_t  *__restrict  __pwc, const char  *__restrict  __s, size_t  __n) __attribute__((__nothrow__, __leaf__));
extern signed int wctomb(char  * __s, wchar_t  __wchar) __attribute__((__nothrow__, __leaf__));
extern size_t mbstowcs(wchar_t  *__restrict  __pwcs, const char  *__restrict  __s, size_t  __n) __attribute__((__nothrow__, __leaf__));
extern size_t wcstombs(char  *__restrict  __s, const wchar_t  *__restrict  __pwcs, size_t  __n) __attribute__((__nothrow__, __leaf__));
typedef signed long ptrdiff_t;
typedef struct  {
  signed long long __max_align_ll __attribute__((__aligned__((_Alignof(signed long long)))));
  long double __max_align_ld __attribute__((__aligned__((_Alignof(long double)))));
  
} max_align_t;
typedef void  *GC_PTR;
typedef unsigned long GC_word;
typedef signed long GC_signed_word;
extern unsigned int GC_get_version(void);
extern __attribute__((__deprecated__)) GC_word GC_gc_no;
extern GC_word GC_get_gc_no(void);
typedef void  *( *GC_oom_func)(size_t  );
extern __attribute__((__deprecated__)) GC_oom_func GC_oom_fn;
extern void GC_set_oom_fn(GC_oom_func  ) __attribute__((__nonnull__(1)));
extern GC_oom_func GC_get_oom_fn(void);
typedef void ( *GC_on_heap_resize_proc)(GC_word  );
extern __attribute__((__deprecated__)) GC_on_heap_resize_proc GC_on_heap_resize;
extern void GC_set_on_heap_resize(GC_on_heap_resize_proc  );
extern GC_on_heap_resize_proc GC_get_on_heap_resize(void);
typedef enum  {
  GC_EVENT_START,
  GC_EVENT_MARK_START,
  GC_EVENT_MARK_END,
  GC_EVENT_RECLAIM_START,
  GC_EVENT_RECLAIM_END,
  GC_EVENT_END,
  GC_EVENT_PRE_STOP_WORLD,
  GC_EVENT_POST_STOP_WORLD,
  GC_EVENT_PRE_START_WORLD,
  GC_EVENT_POST_START_WORLD,
  GC_EVENT_THREAD_SUSPENDED,
  GC_EVENT_THREAD_UNSUSPENDED
} GC_EventType;
typedef void ( *GC_on_collection_event_proc)(GC_EventType  );
extern void GC_set_on_collection_event(GC_on_collection_event_proc  );
extern GC_on_collection_event_proc GC_get_on_collection_event(void);
extern __attribute__((__deprecated__)) signed int GC_find_leak;
extern void GC_set_find_leak(signed int  );
extern signed int GC_get_find_leak(void);
extern __attribute__((__deprecated__)) signed int GC_all_interior_pointers;
extern void GC_set_all_interior_pointers(signed int  );
extern signed int GC_get_all_interior_pointers(void);
extern __attribute__((__deprecated__)) signed int GC_finalize_on_demand;
extern void GC_set_finalize_on_demand(signed int  );
extern signed int GC_get_finalize_on_demand(void);
extern __attribute__((__deprecated__)) signed int GC_java_finalization;
extern void GC_set_java_finalization(signed int  );
extern signed int GC_get_java_finalization(void);
typedef void ( *GC_finalizer_notifier_proc)(void);
extern __attribute__((__deprecated__)) GC_finalizer_notifier_proc GC_finalizer_notifier;
extern void GC_set_finalizer_notifier(GC_finalizer_notifier_proc  );
extern GC_finalizer_notifier_proc GC_get_finalizer_notifier(void);
extern __attribute__((__deprecated__)) signed int GC_dont_gc;
extern __attribute__((__deprecated__)) signed int GC_dont_expand;
extern void GC_set_dont_expand(signed int  );
extern signed int GC_get_dont_expand(void);
extern __attribute__((__deprecated__)) signed int GC_use_entire_heap;
extern __attribute__((__deprecated__)) signed int GC_full_freq;
extern void GC_set_full_freq(signed int  );
extern signed int GC_get_full_freq(void);
extern __attribute__((__deprecated__)) GC_word GC_non_gc_bytes;
extern void GC_set_non_gc_bytes(GC_word  );
extern GC_word GC_get_non_gc_bytes(void);
extern __attribute__((__deprecated__)) signed int GC_no_dls;
extern void GC_set_no_dls(signed int  );
extern signed int GC_get_no_dls(void);
extern __attribute__((__deprecated__)) GC_word GC_free_space_divisor;
extern void GC_set_free_space_divisor(GC_word  );
extern GC_word GC_get_free_space_divisor(void);
extern __attribute__((__deprecated__)) GC_word GC_max_retries;
extern void GC_set_max_retries(GC_word  );
extern GC_word GC_get_max_retries(void);
extern __attribute__((__deprecated__)) char  *GC_stackbottom;
extern __attribute__((__deprecated__)) signed int GC_dont_precollect;
extern void GC_set_dont_precollect(signed int  );
extern signed int GC_get_dont_precollect(void);
extern __attribute__((__deprecated__)) unsigned long GC_time_limit;
extern void GC_set_time_limit(unsigned long  );
extern unsigned long GC_get_time_limit(void);
extern void GC_start_performance_measurement(void);
extern unsigned long GC_get_full_gc_total_time(void);
extern void GC_set_pages_executable(signed int  );
extern signed int GC_get_pages_executable(void);
extern void GC_set_min_bytes_allocd(size_t  );
extern size_t GC_get_min_bytes_allocd(void);
extern void GC_set_rate(signed int  );
extern signed int GC_get_rate(void);
extern void GC_set_max_prior_attempts(signed int  );
extern signed int GC_get_max_prior_attempts(void);
extern void GC_set_handle_fork(signed int  );
extern void GC_atfork_prepare(void);
extern void GC_atfork_parent(void);
extern void GC_atfork_child(void);
extern void GC_init(void);
extern signed int GC_is_init_called(void);
extern void GC_deinit(void);
extern __attribute__((__malloc__)) __attribute__((__alloc_size__(1))) void  *GC_malloc(size_t  );
extern __attribute__((__malloc__)) __attribute__((__alloc_size__(1))) void  *GC_malloc_atomic(size_t  );
extern __attribute__((__malloc__)) char  *GC_strdup(const char  * );
extern __attribute__((__malloc__)) char  *GC_strndup(const char  * , size_t  ) __attribute__((__nonnull__(1)));
extern __attribute__((__malloc__)) __attribute__((__alloc_size__(1))) void  *GC_malloc_uncollectable(size_t  );
extern __attribute__((__deprecated__)) void  *GC_malloc_stubborn(size_t  );
extern __attribute__((__malloc__)) __attribute__((__alloc_size__(2))) void  *GC_memalign(size_t  , size_t  );
extern signed int GC_posix_memalign(void  * * , size_t  , size_t  ) __attribute__((__nonnull__(1)));
extern void GC_free(void  * );
extern __attribute__((__deprecated__)) void GC_change_stubborn(const void  * );
extern void GC_end_stubborn_change(const void  * ) __attribute__((__nonnull__(1)));
extern void  *GC_base(void  * );
extern signed int GC_is_heap_ptr(const void  * );
extern size_t GC_size(const void  * ) __attribute__((__nonnull__(1)));
extern void  *GC_realloc(void  * , size_t  ) __attribute__((__alloc_size__(2)));
extern signed int GC_expand_hp(size_t  );
extern void GC_set_max_heap_size(GC_word  );
extern void GC_exclude_static_roots(void  * , void  * );
extern void GC_clear_roots(void);
extern void GC_add_roots(void  * , void  * );
extern void GC_remove_roots(void  * , void  * );
extern void GC_register_displacement(size_t  );
extern void GC_debug_register_displacement(size_t  );
extern void GC_gcollect(void);
extern void GC_gcollect_and_unmap(void);
typedef signed int ( *GC_stop_func)(void);
extern signed int GC_try_to_collect(GC_stop_func  ) __attribute__((__nonnull__(1)));
extern void GC_set_stop_func(GC_stop_func  ) __attribute__((__nonnull__(1)));
extern GC_stop_func GC_get_stop_func(void);
extern size_t GC_get_heap_size(void);
extern size_t GC_get_free_bytes(void);
extern size_t GC_get_unmapped_bytes(void);
extern size_t GC_get_bytes_since_gc(void);
extern size_t GC_get_expl_freed_bytes_since_gc(void);
extern size_t GC_get_total_bytes(void);
extern void GC_get_heap_usage_safe(GC_word  * , GC_word  * , GC_word  * , GC_word  * , GC_word  * );
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
extern size_t GC_get_prof_stats(struct GC_prof_stats_s  * , size_t  );
extern size_t GC_get_size_map_at(signed int  i);
extern size_t GC_get_memory_use(void);
extern void GC_disable(void);
extern signed int GC_is_disabled(void);
extern void GC_enable(void);
extern void GC_enable_incremental(void);
extern signed int GC_is_incremental_mode(void);
extern signed int GC_incremental_protection_needs(void);
extern signed int GC_collect_a_little(void);
extern __attribute__((__malloc__)) __attribute__((__alloc_size__(1))) void  *GC_malloc_ignore_off_page(size_t  );
extern __attribute__((__malloc__)) __attribute__((__alloc_size__(1))) void  *GC_malloc_atomic_ignore_off_page(size_t  );
extern __attribute__((__malloc__)) __attribute__((__alloc_size__(1))) void  *GC_malloc_atomic_uncollectable(size_t  );
extern __attribute__((__malloc__)) __attribute__((__alloc_size__(1))) void  *GC_debug_malloc_atomic_uncollectable(size_t  , const char  * s, signed int  i);
extern __attribute__((__malloc__)) __attribute__((__alloc_size__(1))) void  *GC_debug_malloc(size_t  , const char  * s, signed int  i);
extern __attribute__((__malloc__)) __attribute__((__alloc_size__(1))) void  *GC_debug_malloc_atomic(size_t  , const char  * s, signed int  i);
extern __attribute__((__malloc__)) char  *GC_debug_strdup(const char  * , const char  * s, signed int  i);
extern __attribute__((__malloc__)) char  *GC_debug_strndup(const char  * , size_t  , const char  * s, signed int  i) __attribute__((__nonnull__(1)));
extern __attribute__((__malloc__)) __attribute__((__alloc_size__(1))) void  *GC_debug_malloc_uncollectable(size_t  , const char  * s, signed int  i);
extern __attribute__((__deprecated__)) void  *GC_debug_malloc_stubborn(size_t  , const char  * s, signed int  i);
extern __attribute__((__malloc__)) __attribute__((__alloc_size__(1))) void  *GC_debug_malloc_ignore_off_page(size_t  , const char  * s, signed int  i);
extern __attribute__((__malloc__)) __attribute__((__alloc_size__(1))) void  *GC_debug_malloc_atomic_ignore_off_page(size_t  , const char  * s, signed int  i);
extern void GC_debug_free(void  * );
extern void  *GC_debug_realloc(void  * , size_t  , const char  * s, signed int  i) __attribute__((__alloc_size__(2)));
extern __attribute__((__deprecated__)) void GC_debug_change_stubborn(const void  * );
extern void GC_debug_end_stubborn_change(const void  * ) __attribute__((__nonnull__(1)));
extern __attribute__((__malloc__)) __attribute__((__alloc_size__(1))) void  *GC_debug_malloc_replacement(size_t  );
extern __attribute__((__alloc_size__(2))) void  *GC_debug_realloc_replacement(void  * , size_t  );
typedef void ( *GC_finalization_proc)(void  * , void  * );
extern void GC_register_finalizer(void  * , GC_finalization_proc  , void  * , GC_finalization_proc  * , void  * * ) __attribute__((__nonnull__(1)));
extern void GC_debug_register_finalizer(void  * , GC_finalization_proc  , void  * , GC_finalization_proc  * , void  * * ) __attribute__((__nonnull__(1)));
extern void GC_register_finalizer_ignore_self(void  * , GC_finalization_proc  , void  * , GC_finalization_proc  * , void  * * ) __attribute__((__nonnull__(1)));
extern void GC_debug_register_finalizer_ignore_self(void  * , GC_finalization_proc  , void  * , GC_finalization_proc  * , void  * * ) __attribute__((__nonnull__(1)));
extern void GC_register_finalizer_no_order(void  * , GC_finalization_proc  , void  * , GC_finalization_proc  * , void  * * ) __attribute__((__nonnull__(1)));
extern void GC_debug_register_finalizer_no_order(void  * , GC_finalization_proc  , void  * , GC_finalization_proc  * , void  * * ) __attribute__((__nonnull__(1)));
extern void GC_register_finalizer_unreachable(void  * , GC_finalization_proc  , void  * , GC_finalization_proc  * , void  * * ) __attribute__((__nonnull__(1)));
extern void GC_debug_register_finalizer_unreachable(void  * , GC_finalization_proc  , void  * , GC_finalization_proc  * , void  * * ) __attribute__((__nonnull__(1)));
extern signed int GC_register_disappearing_link(void  * * ) __attribute__((__nonnull__(1)));
extern signed int GC_general_register_disappearing_link(void  * * , const void  * ) __attribute__((__nonnull__(1))) __attribute__((__nonnull__(2)));
extern signed int GC_move_disappearing_link(void  * * , void  * * ) __attribute__((__nonnull__(2)));
extern signed int GC_unregister_disappearing_link(void  * * );
extern signed int GC_register_long_link(void  * * , const void  * ) __attribute__((__nonnull__(1))) __attribute__((__nonnull__(2)));
extern signed int GC_move_long_link(void  * * , void  * * ) __attribute__((__nonnull__(2)));
extern signed int GC_unregister_long_link(void  * * );
typedef enum  {
  GC_TOGGLE_REF_DROP,
  GC_TOGGLE_REF_STRONG,
  GC_TOGGLE_REF_WEAK
} GC_ToggleRefStatus;
typedef GC_ToggleRefStatus ( *GC_toggleref_func)(void  * );
extern void GC_set_toggleref_func(GC_toggleref_func  );
extern GC_toggleref_func GC_get_toggleref_func(void);
extern signed int GC_toggleref_add(void  * , signed int  ) __attribute__((__nonnull__(1)));
typedef void ( *GC_await_finalize_proc)(void  * );
extern void GC_set_await_finalize_proc(GC_await_finalize_proc  );
extern GC_await_finalize_proc GC_get_await_finalize_proc(void);
extern signed int GC_should_invoke_finalizers(void);
extern signed int GC_invoke_finalizers(void);
typedef void ( *GC_warn_proc)(char  * , GC_word  );
extern void GC_set_warn_proc(GC_warn_proc  ) __attribute__((__nonnull__(1)));
extern GC_warn_proc GC_get_warn_proc(void);
extern void GC_ignore_warn_proc(char  * , GC_word  );
extern void GC_set_log_fd(signed int  );
typedef void ( *GC_abort_func)(const char  * );
extern void GC_set_abort_func(GC_abort_func  ) __attribute__((__nonnull__(1)));
extern GC_abort_func GC_get_abort_func(void);
extern void GC_abort_on_oom(void);
typedef GC_word GC_hidden_pointer;
typedef void  *( *GC_fn_type)(void  * );
extern void  *GC_call_with_alloc_lock(GC_fn_type  , void  * ) __attribute__((__nonnull__(1)));
struct GC_stack_base {
  void  *mem_base;
  
};
typedef void  *( *GC_stack_base_func)(struct GC_stack_base  * , void  * );
extern void  *GC_call_with_stack_base(GC_stack_base_func  , void  * ) __attribute__((__nonnull__(1)));
extern void  *GC_do_blocking(GC_fn_type  , void  * ) __attribute__((__nonnull__(1)));
extern void  *GC_call_with_gc_active(GC_fn_type  , void  * ) __attribute__((__nonnull__(1)));
extern signed int GC_get_stack_base(struct GC_stack_base  * ) __attribute__((__nonnull__(1)));
extern void  *GC_same_obj(void  * , void  * );
extern void  *GC_pre_incr(void  * * , ptrdiff_t  ) __attribute__((__nonnull__(1)));
extern void  *GC_post_incr(void  * * , ptrdiff_t  ) __attribute__((__nonnull__(1)));
extern void  *GC_is_visible(void  * );
extern void  *GC_is_valid_displacement(void  * );
extern void GC_dump(void);
extern void GC_dump_named(const char  * );
extern void GC_dump_regions(void);
extern void GC_dump_finalization(void);
extern void ( *GC_same_obj_print_proc)(void  * , void  * );
extern void ( *GC_is_valid_displacement_print_proc)(void  * );
extern void ( *GC_is_visible_print_proc)(void  * );
extern __attribute__((__malloc__)) void  *GC_malloc_many(size_t  );
typedef signed int ( *GC_has_static_roots_func)(const char  * , void  * , size_t  );
extern void GC_register_has_static_roots_callback(GC_has_static_roots_func  );
extern void GC_set_force_unmap_on_gcollect(signed int  );
extern signed int GC_get_force_unmap_on_gcollect(void);
extern void GC_win32_free_heap(void);
struct __attribute__(()) _string_s {
  size_t length;
  const char  *text;
  
};
static inline void _check_index_string(struct _string_s  s, size_t  i)
{

  {
    if ((((i) < 0) || ((i) >= ((s).length))))
    {
      {
        ((fprintf)((stderr), "String index out of bounds: length %lu, index %lu\n", ((s).length), (i)));
        ((exit)(1));
      }
    } else {
      ;
    }
  }
}
static inline char _index_string(struct _string_s  s, size_t  i)
{

  {
    ((_check_index_string)((s), (i)));
    return (((s).text)[(i)]);
  }
}
static inline _Bool _eq_string(struct _string_s  s1, struct _string_s  s2)
{

  {
    return (!((strcmp)(((s1).text), ((s2).text))));
  }
}
static inline struct _string_s _append_string(struct _string_s  s1, struct _string_s  s2)
{

  {
    char  *result = ((GC_malloc)(((((s1).length) + ((s2).length)) + 1)));
    ((strcpy)((result), ((s1).text)));
    ((strcat)((result), ((s2).text)));
    return ((struct _string_s){(((s1).length) + ((s2).length)), (result)});
  }
}
static inline struct _string_s _repeat_string(struct _string_s  s, size_t  num)
{

  {
    char  *result = ((GC_malloc)(((((s).length) * (num)) + 1)));
    (((result)[0]) = '\0');
    size_t i;
    for (size_t i = 0; ((i) < (num)); ((i)++))
    {
      ((strcat)((result), ((s).text)));
    }
    return ((struct _string_s){(((s).length) * (num)), (result)});
  }
}
static inline struct _string_s _remove_string(struct _string_s  s1, struct _string_s  s2)
{

  {
    size_t i, j;
    char  *result = ((GC_malloc)((((s1).length) + 1)));
    for((((i) = 0) , ((j) = 0)); ((i) < ((s1).length)); ((i)++))
    {
      {
        if ((((i) > (((s1).length) - ((s2).length))) || ((strncmp)((((s1).text) + (i)), ((s2).text), ((s2).length)))))
        {
          {
            (((result)[(j)]) = ((_index_string)((s1), (i))));
            ((j)++);
          }
        } else {
          {
            ((i) += (((s2).length) - 1));
          }
        }
      }
    }
    (((result)[(j)]) = '\0');
    return ((struct _string_s){(j), (result)});
  }
}
static inline struct _string_s _substring(struct _string_s  s, size_t  start, size_t  end)
{

  {
    if (((((((start) < 0) || ((start) >= ((s).length))) || ((end) < 0)) || ((end) >= ((s).length))) || ((start) > (end))))
    {
      {
        ((fprintf)((stderr), "Substring index out of bounds: length %lu, start %lu, end %lu\n", ((s).length), (start), (end)));
        ((exit)(1));
      }
    } else {
      ;
    }
    char  *result = ((GC_malloc)((((end) - (start)) + 1)));
    ((strncpy)((result), (((s).text) + (start)), ((end) - (start))));
    return ((struct _string_s){((end) - (start)), (result)});
  }
}
static inline struct _string_s strCharPointer(char  * s)
{

  {
    size_t len = ((strlen)((s)));
    char  *result = ((GC_malloc)(((len) + 1)));
    ((strcpy)((result), (s)));
    return ((struct _string_s){(len), (result)});
  }
}
static inline struct _string_s strChar(char  c)
{

  {
    char  *result = ((GC_malloc)(2));
    (((result)[0]) = (c));
    (((result)[1]) = '\0');
    return ((struct _string_s){1, (result)});
  }
}
static inline struct _string_s strPointer(void  * ptr)
{

  {
    char  *result = ((GC_malloc)(9));
    ((sprintf)((result), "%lx", ((unsigned long)(ptr))));
    return ((struct _string_s){((strlen)((result))), (result)});
  }
}
static inline struct _string_s showString(struct _string_s  s)
{

  {
    char  *result = ((GC_malloc)(((2 * ((s).length)) + 3)));
    (((result)[0]) = '\"');
    size_t resultIndex = 1;
    for (size_t i = 0; ((i) < ((s).length)); ((i)++))
    {
      {
        char  *tmp;
        switch (((_index_string)((s), (i))))
        {
          {
            case '\a':
              (((result)[((resultIndex)++)]) = '\\');
            
            (((result)[((resultIndex)++)]) = 'a');
            break;
            case '\b':
              (((result)[((resultIndex)++)]) = '\\');
            
            (((result)[((resultIndex)++)]) = 'b');
            break;
            case '\n':
              (((result)[((resultIndex)++)]) = '\\');
            
            (((result)[((resultIndex)++)]) = 'n');
            break;
            case '\r':
              (((result)[((resultIndex)++)]) = '\\');
            
            (((result)[((resultIndex)++)]) = 'r');
            break;
            case '\t':
              (((result)[((resultIndex)++)]) = '\\');
            
            (((result)[((resultIndex)++)]) = 't');
            break;
            case '\v':
              (((result)[((resultIndex)++)]) = '\\');
            
            (((result)[((resultIndex)++)]) = 'v');
            break;
            case '\"':
              case '\'':
                case '\\':
                  case '\?':
                    (((result)[((resultIndex)++)]) = '\\');
                  
                
              
            
            (((result)[((resultIndex)++)]) = ((_index_string)((s), (i))));
            break;
            default:
              (((result)[((resultIndex)++)]) = ((_index_string)((s), (i))));
            
          }
        }
      }
    }
    (((result)[((resultIndex)++)]) = '\"');
    (((result)[(resultIndex)]) = '\0');
    return ((struct _string_s){(resultIndex), (result)});
  }
}
static inline struct _string_s showCharPointer(char  * s)
{

  {
    return ((showString)(((strCharPointer)((s)))));
  }
}
static inline struct _string_s showInt(signed int  i)
{

  {
    char  *result = ((GC_malloc)((((((8 * (sizeof(((i))))) - 1)) / 3) + 2)));
    ((sprintf)((result), "%d", (i)));
    return ((struct _string_s){((strlen)((result))), (result)});
  }
}
static inline struct _string_s showFloat(double  f)
{

  {
    char  *result = ((GC_malloc)((((((8 * (sizeof(((f))))) - 1)) / 3) + 2)));
    ((sprintf)(((char *)(result)), "%g", (f)));
    return ((struct _string_s){((strlen)((result))), (result)});
  }
}
static inline struct _string_s showChar(char  c)
{

  {
    char  *result = ((GC_malloc)(4));
    ((sprintf)(((char *)(result)), "'%c'", (c)));
    return ((struct _string_s){((strlen)((result))), (result)});
  }
}
static inline struct _string_s _showPointer(const char  * baseTypeName, void  * ptr)
{

  {
    char  *result = ((GC_malloc)((((strlen)((baseTypeName))) + 17)));
    ((sprintf)((result), "<%s at 0x%lx>", (baseTypeName), ((unsigned long)(ptr))));
    return ((struct _string_s){((strlen)((result))), (result)});
  }
}
signed int _lvarCheckValue = 1;
signed int eqint(signed int  i1, signed int  i2)
{

  {
    return ((i1) == (i2));
  }
}
struct _string_s showint(signed int  i)
{

  {
    return ((showInt)((i)));
  }
}
typedef struct Set_int Set_int;
struct _GenericDatatype {
  unsigned int refId;
  unsigned int tag;
  
};
struct Set_int {
  unsigned int refId;
  enum _Set_int_types {
    Set_int_int_Empty,
    Set_int_int_Set,
    Set_int_int_Top
  } tag;
  union _Set_int_contents {
    struct Set_int_int_Empty_s {
      
    } int_Empty;
    struct Set_int_int_Set_s {
      signed int f0;
      Set_int  *f1;
      
    } int_Set;
    struct Set_int_int_Top_s {
      
    } int_Top;
    
  } contents;
  
};
static inline Set_int  *int_Empty(void)
{

  Set_int  *temp;
  ((temp) = ({
    
    ((Set_int *)((malloc)((sizeof(Set_int))))); })
  );
  (((temp)->tag) = (Set_int_int_Empty));
  (((temp)->refId) = 13);
  ;
  ;
  return (temp);
}
static inline Set_int  *int_Set(signed int  f0, Set_int  * f1)
{

  Set_int  *temp;
  ((temp) = ({
    
    ((Set_int *)((malloc)((sizeof(Set_int))))); })
  );
  (((temp)->tag) = (Set_int_int_Set));
  (((temp)->refId) = 13);
  ;
  (((((temp)->contents).int_Set).f0) = (f0));
  (((((temp)->contents).int_Set).f1) = (f1));
  ;
  return (temp);
}
static inline Set_int  *int_Top(void)
{

  Set_int  *temp;
  ((temp) = ({
    
    ((Set_int *)((malloc)((sizeof(Set_int))))); })
  );
  (((temp)->tag) = (Set_int_int_Top));
  (((temp)->refId) = 13);
  ;
  ;
  return (temp);
}
struct _string_s showInner_int(Set_int  * set)
{

  {
    struct _string_s result = ((strCharPointer)(""));
    {
      /* match ((set)) ... */;
      Set_int  *_match_scrutinee_val = (set);
      Set_int  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
      /* matching for pattern int_Empty() */;
      /* ... declarations of pattern variables */;
      ;
      Set_int  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
      if (({
        signed int _match = 1;
        /* matching against a ADT constructor pattern */;
        /* match against constructor */;
        if (((((*(_curr_scrutinee_ptr)))->tag) != (Set_int_int_Empty)))
        {
          ((_match) = 0);
        } else {
          /* match against sub-patterns, setting _match to 0 on a fail */;
          Set_int  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
          ;
        }
        (_match); })
      )
      {
        ;
      } else {
        /* matching for pattern int_Set(hd,tl) */;
        /* ... declarations of pattern variables */;
        signed int hd;
        Set_int  *tl;
        Set_int  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
        if (({
          signed int _match = 1;
          /* matching against a ADT constructor pattern */;
          /* match against constructor */;
          if (((((*(_curr_scrutinee_ptr)))->tag) != (Set_int_int_Set)))
          {
            ((_match) = 0);
          } else {
            /* match against sub-patterns, setting _match to 0 on a fail */;
            Set_int  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
            {
              signed int  *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).int_Set).f0));
              ((hd) = (*(_curr_scrutinee_ptr)));
            }
            {
              Set_int  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).int_Set).f1));
              ((tl) = (*(_curr_scrutinee_ptr)));
            }
            ;
          }
          (_match); })
        )
        {
          ((result) = ((showint)((hd))));
          {
            /* match ((tl)) ... */;
            Set_int  *_match_scrutinee_val = (tl);
            Set_int  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
            /* matching for pattern int_Empty() */;
            /* ... declarations of pattern variables */;
            ;
            Set_int  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
            if (({
              signed int _match = 1;
              /* matching against a ADT constructor pattern */;
              /* match against constructor */;
              if (((((*(_curr_scrutinee_ptr)))->tag) != (Set_int_int_Empty)))
              {
                ((_match) = 0);
              } else {
                /* match against sub-patterns, setting _match to 0 on a fail */;
                Set_int  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
                ;
              }
              (_match); })
            )
            {
              ;
            } else {
              /* matching for pattern _ */;
              /* ... declarations of pattern variables */;
              ;
              Set_int  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
              if (({
                signed int _match = 1;
                ;
                (_match); })
              )
              {
                ({
                  struct _string_s  *_tmp23 = (&(result));
                  ((*(_tmp23)) = ((_append_string)((*(_tmp23)), ((_append_string)(((strCharPointer)(", ")), ((showInner_int)((tl)))))))); })
                ;
              } else {
                /* no match, do nothing. */;
              }
            }
          }
        } else {
          /* matching for pattern int_Top() */;
          /* ... declarations of pattern variables */;
          ;
          Set_int  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
          if (({
            signed int _match = 1;
            /* matching against a ADT constructor pattern */;
            /* match against constructor */;
            if (((((*(_curr_scrutinee_ptr)))->tag) != (Set_int_int_Top)))
            {
              ((_match) = 0);
            } else {
              /* match against sub-patterns, setting _match to 0 on a fail */;
              Set_int  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
              ;
            }
            (_match); })
          )
          {
            ((result) = ((strCharPointer)("Top()")));
          } else {
            /* no match, do nothing. */;
          }
        }
      }
    }
    return (result);
  }
}
struct _string_s showSet_int(Set_int  * set)
{

  {
    return ((_append_string)(((_append_string)(((strCharPointer)("{")), ((showInner_int)((set))))), ((strCharPointer)("}"))));
  }
}
signed int isSubset_int(Set_int  * set1, Set_int  * set2)
{

  {
    {
      /* match ((set1)) ... */;
      Set_int  *_match_scrutinee_val = (set1);
      Set_int  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
      /* matching for pattern int_Empty() */;
      /* ... declarations of pattern variables */;
      ;
      Set_int  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
      if (({
        signed int _match = 1;
        /* matching against a ADT constructor pattern */;
        /* match against constructor */;
        if (((((*(_curr_scrutinee_ptr)))->tag) != (Set_int_int_Empty)))
        {
          ((_match) = 0);
        } else {
          /* match against sub-patterns, setting _match to 0 on a fail */;
          Set_int  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
          ;
        }
        (_match); })
      )
      {
        return 1;
      } else {
        /* matching for pattern int_Top() */;
        /* ... declarations of pattern variables */;
        ;
        Set_int  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
        if (({
          signed int _match = 1;
          /* matching against a ADT constructor pattern */;
          /* match against constructor */;
          if (((((*(_curr_scrutinee_ptr)))->tag) != (Set_int_int_Top)))
          {
            ((_match) = 0);
          } else {
            /* match against sub-patterns, setting _match to 0 on a fail */;
            Set_int  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
            ;
          }
          (_match); })
        )
        {
          return 0;
        } else {
          /* matching for pattern int_Set(hd1,tl1) */;
          /* ... declarations of pattern variables */;
          signed int hd1;
          Set_int  *tl1;
          Set_int  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
          if (({
            signed int _match = 1;
            /* matching against a ADT constructor pattern */;
            /* match against constructor */;
            if (((((*(_curr_scrutinee_ptr)))->tag) != (Set_int_int_Set)))
            {
              ((_match) = 0);
            } else {
              /* match against sub-patterns, setting _match to 0 on a fail */;
              Set_int  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
              {
                signed int  *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).int_Set).f0));
                ((hd1) = (*(_curr_scrutinee_ptr)));
              }
              {
                Set_int  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).int_Set).f1));
                ((tl1) = (*(_curr_scrutinee_ptr)));
              }
              ;
            }
            (_match); })
          )
          {
            {
              /* match ((set2)) ... */;
              Set_int  *_match_scrutinee_val = (set2);
              Set_int  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
              /* matching for pattern int_Empty() */;
              /* ... declarations of pattern variables */;
              ;
              Set_int  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
              if (({
                signed int _match = 1;
                /* matching against a ADT constructor pattern */;
                /* match against constructor */;
                if (((((*(_curr_scrutinee_ptr)))->tag) != (Set_int_int_Empty)))
                {
                  ((_match) = 0);
                } else {
                  /* match against sub-patterns, setting _match to 0 on a fail */;
                  Set_int  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
                  ;
                }
                (_match); })
              )
              {
                return 0;
              } else {
                /* matching for pattern int_Top() */;
                /* ... declarations of pattern variables */;
                ;
                Set_int  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
                if (({
                  signed int _match = 1;
                  /* matching against a ADT constructor pattern */;
                  /* match against constructor */;
                  if (((((*(_curr_scrutinee_ptr)))->tag) != (Set_int_int_Top)))
                  {
                    ((_match) = 0);
                  } else {
                    /* match against sub-patterns, setting _match to 0 on a fail */;
                    Set_int  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
                    ;
                  }
                  (_match); })
                )
                {
                  return 0;
                } else {
                  /* matching for pattern int_Set(hd2,tl2) */;
                  /* ... declarations of pattern variables */;
                  signed int hd2;
                  Set_int  *tl2;
                  Set_int  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
                  if (({
                    signed int _match = 1;
                    /* matching against a ADT constructor pattern */;
                    /* match against constructor */;
                    if (((((*(_curr_scrutinee_ptr)))->tag) != (Set_int_int_Set)))
                    {
                      ((_match) = 0);
                    } else {
                      /* match against sub-patterns, setting _match to 0 on a fail */;
                      Set_int  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
                      {
                        signed int  *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).int_Set).f0));
                        ((hd2) = (*(_curr_scrutinee_ptr)));
                      }
                      {
                        Set_int  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).int_Set).f1));
                        ((tl2) = (*(_curr_scrutinee_ptr)));
                      }
                      ;
                    }
                    (_match); })
                  )
                  {
                    if (((eqint)((hd1), (hd2))))
                    {
                      {
                        return ((isSubset_int)((tl1), (tl2)));
                      }
                    } else {
                      ;
                    }
                    return (((isSubset_int)(((int_Set)((hd1), ((int_Empty)()))), (tl2))) && ((isSubset_int)((tl1), (set2))));
                  } else {
                    /* no match, do nothing. */;
                  }
                }
              }
            }
          } else {
            /* no match, do nothing. */;
          }
        }
      }
    }
  }
}
signed int eqSet_int(Set_int  * set1, Set_int  * set2)
{

  {
    {
      /* match ((set1)) ... */;
      Set_int  *_match_scrutinee_val = (set1);
      Set_int  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
      /* matching for pattern int_Top() */;
      /* ... declarations of pattern variables */;
      ;
      Set_int  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
      if (({
        signed int _match = 1;
        /* matching against a ADT constructor pattern */;
        /* match against constructor */;
        if (((((*(_curr_scrutinee_ptr)))->tag) != (Set_int_int_Top)))
        {
          ((_match) = 0);
        } else {
          /* match against sub-patterns, setting _match to 0 on a fail */;
          Set_int  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
          ;
        }
        (_match); })
      )
      {
        {
          /* match ((set2)) ... */;
          Set_int  *_match_scrutinee_val = (set2);
          Set_int  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
          /* matching for pattern int_Top() */;
          /* ... declarations of pattern variables */;
          ;
          Set_int  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
          if (({
            signed int _match = 1;
            /* matching against a ADT constructor pattern */;
            /* match against constructor */;
            if (((((*(_curr_scrutinee_ptr)))->tag) != (Set_int_int_Top)))
            {
              ((_match) = 0);
            } else {
              /* match against sub-patterns, setting _match to 0 on a fail */;
              Set_int  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
              ;
            }
            (_match); })
          )
          {
            return 1;
          } else {
            /* matching for pattern _ */;
            /* ... declarations of pattern variables */;
            ;
            Set_int  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
            if (({
              signed int _match = 1;
              ;
              (_match); })
            )
            {
              return 0;
            } else {
              /* no match, do nothing. */;
            }
          }
        }
      } else {
        /* matching for pattern _ */;
        /* ... declarations of pattern variables */;
        ;
        Set_int  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
        if (({
          signed int _match = 1;
          ;
          (_match); })
        )
        {
          return (((isSubset_int)((set1), (set2))) && ((isSubset_int)((set2), (set1))));
        } else {
          /* no match, do nothing. */;
        }
      }
    }
  }
}
signed int leqSet_int(Set_int  * set1, Set_int  * set2)
{

  {
    return ((isSubset_int)((set1), (set2)));
  }
}
signed int isInSet_int(signed int  item, Set_int  * set)
{

  {
    {
      /* match ((set)) ... */;
      Set_int  *_match_scrutinee_val = (set);
      Set_int  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
      /* matching for pattern int_Empty() */;
      /* ... declarations of pattern variables */;
      ;
      Set_int  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
      if (({
        signed int _match = 1;
        /* matching against a ADT constructor pattern */;
        /* match against constructor */;
        if (((((*(_curr_scrutinee_ptr)))->tag) != (Set_int_int_Empty)))
        {
          ((_match) = 0);
        } else {
          /* match against sub-patterns, setting _match to 0 on a fail */;
          Set_int  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
          ;
        }
        (_match); })
      )
      {
        return 0;
      } else {
        /* matching for pattern int_Top() */;
        /* ... declarations of pattern variables */;
        ;
        Set_int  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
        if (({
          signed int _match = 1;
          /* matching against a ADT constructor pattern */;
          /* match against constructor */;
          if (((((*(_curr_scrutinee_ptr)))->tag) != (Set_int_int_Top)))
          {
            ((_match) = 0);
          } else {
            /* match against sub-patterns, setting _match to 0 on a fail */;
            Set_int  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
            ;
          }
          (_match); })
        )
        {
          return 0;
        } else {
          /* matching for pattern int_Set(hd,tl) */;
          /* ... declarations of pattern variables */;
          signed int hd;
          Set_int  *tl;
          Set_int  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
          if (({
            signed int _match = 1;
            /* matching against a ADT constructor pattern */;
            /* match against constructor */;
            if (((((*(_curr_scrutinee_ptr)))->tag) != (Set_int_int_Set)))
            {
              ((_match) = 0);
            } else {
              /* match against sub-patterns, setting _match to 0 on a fail */;
              Set_int  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
              {
                signed int  *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).int_Set).f0));
                ((hd) = (*(_curr_scrutinee_ptr)));
              }
              {
                Set_int  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).int_Set).f1));
                ((tl) = (*(_curr_scrutinee_ptr)));
              }
              ;
            }
            (_match); })
          )
          {
            if (((eqint)((hd), (item))))
            {
              {
                return 1;
              }
            } else {
              ;
            }
            return ((isInSet_int)((item), (tl)));
          } else {
            /* no match, do nothing. */;
          }
        }
      }
    }
  }
}
Set_int  *lubSet_int(Set_int  * set1, Set_int  * set2)
{

  {
    {
      /* match ((set1)) ... */;
      Set_int  *_match_scrutinee_val = (set1);
      Set_int  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
      /* matching for pattern int_Empty() */;
      /* ... declarations of pattern variables */;
      ;
      Set_int  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
      if (({
        signed int _match = 1;
        /* matching against a ADT constructor pattern */;
        /* match against constructor */;
        if (((((*(_curr_scrutinee_ptr)))->tag) != (Set_int_int_Empty)))
        {
          ((_match) = 0);
        } else {
          /* match against sub-patterns, setting _match to 0 on a fail */;
          Set_int  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
          ;
        }
        (_match); })
      )
      {
        return (set2);
      } else {
        /* matching for pattern int_Top() */;
        /* ... declarations of pattern variables */;
        ;
        Set_int  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
        if (({
          signed int _match = 1;
          /* matching against a ADT constructor pattern */;
          /* match against constructor */;
          if (((((*(_curr_scrutinee_ptr)))->tag) != (Set_int_int_Top)))
          {
            ((_match) = 0);
          } else {
            /* match against sub-patterns, setting _match to 0 on a fail */;
            Set_int  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
            ;
          }
          (_match); })
        )
        {
          return ((int_Top)());
        } else {
          /* matching for pattern int_Set(hd1,tl1) */;
          /* ... declarations of pattern variables */;
          signed int hd1;
          Set_int  *tl1;
          Set_int  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
          if (({
            signed int _match = 1;
            /* matching against a ADT constructor pattern */;
            /* match against constructor */;
            if (((((*(_curr_scrutinee_ptr)))->tag) != (Set_int_int_Set)))
            {
              ((_match) = 0);
            } else {
              /* match against sub-patterns, setting _match to 0 on a fail */;
              Set_int  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
              {
                signed int  *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).int_Set).f0));
                ((hd1) = (*(_curr_scrutinee_ptr)));
              }
              {
                Set_int  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).int_Set).f1));
                ((tl1) = (*(_curr_scrutinee_ptr)));
              }
              ;
            }
            (_match); })
          )
          {
            {
              /* match ((set2)) ... */;
              Set_int  *_match_scrutinee_val = (set2);
              Set_int  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
              /* matching for pattern int_Empty() */;
              /* ... declarations of pattern variables */;
              ;
              Set_int  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
              if (({
                signed int _match = 1;
                /* matching against a ADT constructor pattern */;
                /* match against constructor */;
                if (((((*(_curr_scrutinee_ptr)))->tag) != (Set_int_int_Empty)))
                {
                  ((_match) = 0);
                } else {
                  /* match against sub-patterns, setting _match to 0 on a fail */;
                  Set_int  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
                  ;
                }
                (_match); })
              )
              {
                return (set1);
              } else {
                /* matching for pattern int_Top() */;
                /* ... declarations of pattern variables */;
                ;
                Set_int  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
                if (({
                  signed int _match = 1;
                  /* matching against a ADT constructor pattern */;
                  /* match against constructor */;
                  if (((((*(_curr_scrutinee_ptr)))->tag) != (Set_int_int_Top)))
                  {
                    ((_match) = 0);
                  } else {
                    /* match against sub-patterns, setting _match to 0 on a fail */;
                    Set_int  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
                    ;
                  }
                  (_match); })
                )
                {
                  return ((int_Top)());
                } else {
                  /* matching for pattern int_Set(_,_) */;
                  /* ... declarations of pattern variables */;
                  ;
                  Set_int  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
                  if (({
                    signed int _match = 1;
                    /* matching against a ADT constructor pattern */;
                    /* match against constructor */;
                    if (((((*(_curr_scrutinee_ptr)))->tag) != (Set_int_int_Set)))
                    {
                      ((_match) = 0);
                    } else {
                      /* match against sub-patterns, setting _match to 0 on a fail */;
                      Set_int  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
                      {
                        signed int  *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).int_Set).f0));
                        ;
                      }
                      {
                        Set_int  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).int_Set).f1));
                        ;
                      }
                      ;
                    }
                    (_match); })
                  )
                  {
                    Set_int  *partial = ((lubSet_int)((tl1), (set2)));
                    {
                      /* match ((partial)) ... */;
                      Set_int  *_match_scrutinee_val = (partial);
                      Set_int  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
                      /* matching for pattern int_Empty() */;
                      /* ... declarations of pattern variables */;
                      ;
                      Set_int  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
                      if (({
                        signed int _match = 1;
                        /* matching against a ADT constructor pattern */;
                        /* match against constructor */;
                        if (((((*(_curr_scrutinee_ptr)))->tag) != (Set_int_int_Empty)))
                        {
                          ((_match) = 0);
                        } else {
                          /* match against sub-patterns, setting _match to 0 on a fail */;
                          Set_int  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
                          ;
                        }
                        (_match); })
                      )
                      {
                        return ((int_Set)((hd1), ((int_Empty)())));
                      } else {
                        /* matching for pattern int_Top() */;
                        /* ... declarations of pattern variables */;
                        ;
                        Set_int  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
                        if (({
                          signed int _match = 1;
                          /* matching against a ADT constructor pattern */;
                          /* match against constructor */;
                          if (((((*(_curr_scrutinee_ptr)))->tag) != (Set_int_int_Top)))
                          {
                            ((_match) = 0);
                          } else {
                            /* match against sub-patterns, setting _match to 0 on a fail */;
                            Set_int  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
                            ;
                          }
                          (_match); })
                        )
                        {
                          return ((int_Top)());
                        } else {
                          /* matching for pattern int_Set(_,_) */;
                          /* ... declarations of pattern variables */;
                          ;
                          Set_int  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
                          if (({
                            signed int _match = 1;
                            /* matching against a ADT constructor pattern */;
                            /* match against constructor */;
                            if (((((*(_curr_scrutinee_ptr)))->tag) != (Set_int_int_Set)))
                            {
                              ((_match) = 0);
                            } else {
                              /* match against sub-patterns, setting _match to 0 on a fail */;
                              Set_int  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
                              {
                                signed int  *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).int_Set).f0));
                                ;
                              }
                              {
                                Set_int  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).int_Set).f1));
                                ;
                              }
                              ;
                            }
                            (_match); })
                          )
                          {
                            if (((isInSet_int)((hd1), (partial))))
                            {
                              {
                                return (partial);
                              }
                            } else {
                              ;
                            }
                            return ((int_Set)((hd1), (partial)));
                          } else {
                            /* no match, do nothing. */;
                          }
                        }
                      }
                    }
                  } else {
                    /* no match, do nothing. */;
                  }
                }
              }
            }
          } else {
            /* no match, do nothing. */;
          }
        }
      }
    }
  }
}
typedef Set_int  *_template_param_unused_24;
typedef __attribute__(()) struct _template__Lattice__pointer__tag_struct_Set_int_13__ _template__Lattice__pointer__tag_struct_Set_int_13__;
struct _template__Lattice__pointer__tag_struct_Set_int_13__ {
  Set_int  *_bottom;
  Set_int  *_top;
  signed int ( *_leq)();
  Set_int  *( *_lub)();
  signed int ( *_eq)();
  struct _string_s ( *_show)();
  
};
typedef Set_int  *_template_param_unused_28;
static struct _template__Lattice__pointer__tag_struct_Set_int_13__  *_template__newLattice__pointer__tag_struct_Set_int_13__(Set_int  * least, Set_int  * greatest, signed int ( * leq)(), Set_int  *( * lub)(), signed int ( * eq)(), struct _string_s ( * showMethod)())
{

  {
    struct _template__Lattice__pointer__tag_struct_Set_int_13__  *l = ((malloc)((sizeof(struct _template__Lattice__pointer__tag_struct_Set_int_13__))));
    (((l)->_bottom) = (least));
    (((l)->_top) = (greatest));
    (((l)->_leq) = (leq));
    (((l)->_lub) = (lub));
    (((l)->_eq) = (eq));
    (((l)->_show) = (showMethod));
    return (l);
  }
}
struct _template__Lattice__pointer__tag_struct_Set_int_13__  *latticeint()
{

  {
    return ((_template__newLattice__pointer__tag_struct_Set_int_13__)(((int_Empty)()), ((int_Top)()), (leqSet_int), (lubSet_int), (eqSet_int), (showSet_int)));
  }
}
typedef Set_int  *_template_param_unused_29;
typedef __attribute__(()) struct _template__Lvar__pointer__tag_struct_Set_int_13__ _template__Lvar__pointer__tag_struct_Set_int_13__;
struct _template__Lvar__pointer__tag_struct_Set_int_13__ {
  struct _template__Lattice__pointer__tag_struct_Set_int_13__  *_lattice;
  Set_int  *_value;
  signed int _frozen;
  
};
signed int buildSet(signed int  start, signed int  stop, struct _template__Lvar__pointer__tag_struct_Set_int_13__  * l);
typedef Set_int  *_template_param_unused_33;
static signed int _template__put__pointer__tag_struct_Set_int_13__(struct _template__Lvar__pointer__tag_struct_Set_int_13__  * l, Set_int  * newState)
{

  {
    if (((l)->_frozen))
    {
      {
        ((printf)("Error: can't write to a frozen lvar.\n"));
        ((exit)(0));
        return 0;
      }
    } else {
      ;
    }
    Set_int  *oldState = ((l)->_value);
    Set_int  *newValue = ((((l)->_lattice)->_lub)((oldState), (newState)));
    if (((((l)->_lattice)->_eq)((((l)->_lattice)->_top), (newValue))))
    {
      {
        ((printf)("Error: invalid put of %s\n", (((((l)->_lattice)->_show)((newState))).text)));
        ((exit)(0));
        return 0;
      }
    } else {
      ;
    }
    (((l)->_value) = (newValue));
    return 1;
  }
}
signed int buildSet(signed int  start, signed int  stop, struct _template__Lvar__pointer__tag_struct_Set_int_13__  * l)
{

  {
    if (((stop) < (start)))
    {
      {
        ((_template__put__pointer__tag_struct_Set_int_13__)((l), ((int_Empty)())));
        return 1;
      }
    } else {
      ;
    }
    ((_template__put__pointer__tag_struct_Set_int_13__)((l), ((int_Set)((start), ((int_Empty)())))));
    signed int res1, res2, res3;
    ((res1) = ((buildSet)(((start) + 2), ((stop) - 2), (l))));
    ((res3) = ((buildSet)(((start) + 2), ((stop) - 2), (l))));
    ((res2) = ((buildSet)(((start) + 1), (stop), (l))));
    return (((res1) && (res2)) && (res3));
  }
}
typedef Set_int  *_template_param_unused_37;
static struct _template__Lvar__pointer__tag_struct_Set_int_13__  *_template__new__pointer__tag_struct_Set_int_13__(struct _template__Lattice__pointer__tag_struct_Set_int_13__  * l)
{

  {
    struct _template__Lvar__pointer__tag_struct_Set_int_13__  *lvarNew = ((malloc)((sizeof(struct _template__Lvar__pointer__tag_struct_Set_int_13__))));
    (((lvarNew)->_value) = ((l)->_bottom));
    (((lvarNew)->_lattice) = (l));
    (((lvarNew)->_frozen) = 0);
    return (lvarNew);
  }
}
typedef Set_int  *_template_param_unused_38;
typedef __attribute__(()) struct _template__ThresholdSet__pointer__tag_struct_Set_int_13__ _template__ThresholdSet__pointer__tag_struct_Set_int_13__;
typedef Set_int  *_template_param_unused_39;
typedef __attribute__(()) struct _template__ActivationSet__pointer__tag_struct_Set_int_13__ _template__ActivationSet__pointer__tag_struct_Set_int_13__;
struct _template__ActivationSet__pointer__tag_struct_Set_int_13__ {
  signed int _size;
  Set_int  * *_set;
  signed int _index;
  struct _template__Lattice__pointer__tag_struct_Set_int_13__  *_lattice;
  
};
struct _template__ThresholdSet__pointer__tag_struct_Set_int_13__ {
  struct _template__Lattice__pointer__tag_struct_Set_int_13__  *_lattice;
  signed int _size;
  signed int _index;
  struct _template__ActivationSet__pointer__tag_struct_Set_int_13__  * *_a_sets;
  
};
typedef Set_int  *_template_param_unused_255;
typedef Set_int  *_template_param_unused_277;
static struct _string_s _template__showActivation__pointer__tag_struct_Set_int_13__(struct _template__ActivationSet__pointer__tag_struct_Set_int_13__  * act)
{

  {
    struct _string_s result = ((strCharPointer)("{"));
    signed int i = 0;
    for(; ((i) < (((act)->_index) - 1)); ((i)++))
    {
      {
        ({
          struct _string_s  *_tmp278 = (&(result));
          ((*(_tmp278)) = ((_append_string)((*(_tmp278)), ((_append_string)(((((act)->_lattice)->_show)((((act)->_set)[(i)]))), ((strCharPointer)(", "))))))); })
        ;
      }
    }
    for(; ((i) < ((act)->_index)); ((i)++))
    {
      {
        ({
          struct _string_s  *_tmp279 = (&(result));
          ((*(_tmp279)) = ((_append_string)((*(_tmp279)), ((((act)->_lattice)->_show)((((act)->_set)[(i)])))))); })
        ;
      }
    }
    return ((_append_string)((result), ((strCharPointer)("}"))));
  }
}
typedef Set_int  *_template_param_unused_301;
static struct _string_s _template__showThreshold__pointer__tag_struct_Set_int_13__(struct _template__ThresholdSet__pointer__tag_struct_Set_int_13__  * t)
{

  {
    struct _string_s result = ((strCharPointer)("{"));
    signed int i = 0;
    for(; ((i) < (((t)->_index) - 1)); ((i)++))
    {
      {
        ({
          struct _string_s  *_tmp302 = (&(result));
          ((*(_tmp302)) = ((_append_string)((*(_tmp302)), ((_append_string)(((_template__showActivation__pointer__tag_struct_Set_int_13__)((((t)->_a_sets)[(i)]))), ((strCharPointer)(", "))))))); })
        ;
      }
    }
    for(; ((i) < ((t)->_index)); ((i)++))
    {
      {
        ({
          struct _string_s  *_tmp303 = (&(result));
          ((*(_tmp303)) = ((_append_string)((*(_tmp303)), ((_template__showActivation__pointer__tag_struct_Set_int_13__)((((t)->_a_sets)[(i)])))))); })
        ;
      }
    }
    return ((_append_string)((result), ((strCharPointer)("}"))));
  }
}
typedef Set_int  *_template_param_unused_307;
static signed int _template__resizeThresholdSet__pointer__tag_struct_Set_int_13__(struct _template__ThresholdSet__pointer__tag_struct_Set_int_13__  * t, signed int  newSize)
{

  {
    struct _template__ActivationSet__pointer__tag_struct_Set_int_13__  * *newSet = ((malloc)(((sizeof(struct _template__ActivationSet__pointer__tag_struct_Set_int_13__ *)) * (newSize))));
    for (signed int i = 0; ((i) < ((t)->_index)); ((i)++))
    {
      {
        (((newSet)[(i)]) = (((t)->_a_sets)[(i)]));
      }
    }
    ((free)(((t)->_a_sets)));
    (((t)->_a_sets) = (newSet));
    (((t)->_size) = (newSize));
    return 1;
  }
}
typedef Set_int  *_template_param_unused_315;
static signed int _template__incompat__pointer__tag_struct_Set_int_13__(struct _template__Lattice__pointer__tag_struct_Set_int_13__  * l, struct _template__ActivationSet__pointer__tag_struct_Set_int_13__  * Q, struct _template__ActivationSet__pointer__tag_struct_Set_int_13__  * R)
{

  {
    if (((((Q)->_lattice) != (l)) || (((R)->_lattice) != (l))))
    {
      {
        ((printf)("Error: The activation sets %s and %s don't belong to the same lattice!\n", (((_template__showActivation__pointer__tag_struct_Set_int_13__)((Q))).text), (((_template__showActivation__pointer__tag_struct_Set_int_13__)((R))).text)));
        ((exit)(0));
      }
    } else {
      ;
    }
    if (((((Q)->_lattice) != (l)) || (((R)->_lattice) != (l))))
    {
      {
        return 0;
      }
    } else {
      ;
    }
    for (signed int i = 0; ((i) < ((Q)->_index)); ((i)++))
    {
      {
        for (signed int j = 0; ((j) < ((R)->_index)); ((j)++))
        {
          {
            Set_int  *q = (((Q)->_set)[(i)]);
            Set_int  *r = (((R)->_set)[(j)]);
            if ((!((((l)->_eq)((((l)->_lub)((q), (r))), ((l)->_top))))))
            {
              {
                ((printf)("Error: %s and %s are compatible, with lub %s!\n", ((((l)->_show)((q))).text), ((((l)->_show)((r))).text), ((((l)->_show)((((l)->_lub)((q), (r))))).text)));
                ((exit)(0));
                return 0;
              }
            } else {
              ;
            }
          }
        }
      }
    }
    return 1;
  }
}
static struct _template__ThresholdSet__pointer__tag_struct_Set_int_13__  *_template__addThreshold__pointer__tag_struct_Set_int_13__(struct _template__ThresholdSet__pointer__tag_struct_Set_int_13__  * t, struct _template__ActivationSet__pointer__tag_struct_Set_int_13__  * act)
{

  {
    if ((((t)->_lattice) != ((act)->_lattice)))
    {
      {
        ((printf)("Error: activation set %s and threshold set %s do not have the same lattice. \n", (((_template__showActivation__pointer__tag_struct_Set_int_13__)((act))).text), (((_template__showThreshold__pointer__tag_struct_Set_int_13__)((t))).text)));
        ((exit)(0));
      }
    } else {
      ;
    }
    if ((((t)->_index) >= ((t)->_size)))
    {
      {
        ((_template__resizeThresholdSet__pointer__tag_struct_Set_int_13__)((t), ((2 * ((t)->_size)) + 1)));
      }
    } else {
      ;
    }
    for (signed int i = 0; ((i) < ((t)->_index)); ((i)++))
    {
      {
        if ((!((_template__incompat__pointer__tag_struct_Set_int_13__)(((t)->_lattice), (((t)->_a_sets)[(i)]), (act)))))
        {
          {
            return (t);
          }
        } else {
          ;
        }
      }
    }
    ((((t)->_a_sets)[((t)->_index)]) = (act));
    (((t)->_index)++);
    return (t);
  }
}
typedef Set_int  *_template_param_unused_319;
static struct _template__ThresholdSet__pointer__tag_struct_Set_int_13__  *_template__newThresholdSet__pointer__tag_struct_Set_int_13__(struct _template__Lattice__pointer__tag_struct_Set_int_13__  * l, signed int  size)
{

  {
    if (((size) < 0))
    {
      {
        ((printf)("Error: Can't create a threshold set of negative size!\n"));
        ((exit)(0));
      }
    } else {
      ;
    }
    struct _template__ThresholdSet__pointer__tag_struct_Set_int_13__  *t = ((malloc)((sizeof(struct _template__ThresholdSet__pointer__tag_struct_Set_int_13__))));
    (((t)->_lattice) = (l));
    (((t)->_size) = (size));
    (((t)->_index) = 0);
    (((t)->_a_sets) = ((malloc)(((sizeof(struct _template__ActivationSet__pointer__tag_struct_Set_int_13__ *)) * (size)))));
    return (t);
  }
}
typedef Set_int  *_template_param_unused_339;
typedef Set_int  *_template_param_unused_343;
static signed int _template__resizeActSet__pointer__tag_struct_Set_int_13__(struct _template__ActivationSet__pointer__tag_struct_Set_int_13__  * act, signed int  newSize)
{

  {
    Set_int  * *newSet = ((malloc)(((sizeof(Set_int * *)) * (newSize))));
    for (signed int i = 0; ((i) < ((act)->_size)); ((i)++))
    {
      {
        (((newSet)[(i)]) = (((act)->_set)[(i)]));
      }
    }
    ((free)(((act)->_set)));
    (((act)->_set) = (newSet));
    (((act)->_size) = (newSize));
    return 1;
  }
}
static struct _template__ActivationSet__pointer__tag_struct_Set_int_13__  *_template__addAct__pointer__tag_struct_Set_int_13__(struct _template__ActivationSet__pointer__tag_struct_Set_int_13__  * act, Set_int  * element)
{

  {
    if ((((act)->_index) >= ((act)->_size)))
    {
      {
        ((_template__resizeActSet__pointer__tag_struct_Set_int_13__)((act), ((2 * ((act)->_size)) + 1)));
      }
    } else {
      ;
    }
    ((((act)->_set)[((act)->_index)]) = (element));
    (((act)->_index)++);
    return (act);
  }
}
typedef Set_int  *_template_param_unused_347;
static struct _template__ActivationSet__pointer__tag_struct_Set_int_13__  *_template__newActivationSet__pointer__tag_struct_Set_int_13__(struct _template__Lattice__pointer__tag_struct_Set_int_13__  * l, signed int  size)
{

  {
    if (((size) < 0))
    {
      {
        ((printf)("Can't create an activation set of negative size!\n"));
        ((exit)(0));
      }
    } else {
      ;
    }
    struct _template__ActivationSet__pointer__tag_struct_Set_int_13__  *act = ((malloc)((sizeof(struct _template__ActivationSet__pointer__tag_struct_Set_int_13__))));
    (((act)->_size) = (size));
    (((act)->_set) = ((malloc)(((sizeof(Set_int *)) * (size)))));
    (((act)->_index) = 0);
    (((act)->_lattice) = (l));
    return (act);
  }
}
typedef Set_int  *_template_param_unused_351;
static struct _template__ActivationSet__pointer__tag_struct_Set_int_13__  *_template__get__pointer__tag_struct_Set_int_13__(struct _template__Lvar__pointer__tag_struct_Set_int_13__  * l, struct _template__ThresholdSet__pointer__tag_struct_Set_int_13__  * t)
{

  {
    if ((((l)->_lattice) != ((t)->_lattice)))
    {
      {
        ((printf)("Error: can't get() when Lvar doesn't have same lattice as threshold set.\n"));
        ((exit)(0));
      }
    } else {
      ;
    }
    for (signed int i = 0; ((i) < ((t)->_index)); ((i)++))
    {
      {
        for (signed int j = 0; ((j) < ((((t)->_a_sets)[(i)])->_index)); ((j)++))
        {
          {
            if (((((l)->_lattice)->_leq)((((((t)->_a_sets)[(i)])->_set)[(j)]), ((l)->_value))))
            {
              {
                return (((t)->_a_sets)[(i)]);
              }
            } else {
              ;
            }
          }
        }
      }
    }
    return (((void *)0));
  }
}
typedef Set_int  *_template_param_unused_355;
static Set_int  *_template__freeze__pointer__tag_struct_Set_int_13__(struct _template__Lvar__pointer__tag_struct_Set_int_13__  * l)
{

  {
    (((l)->_frozen) = 1);
    return ((l)->_value);
  }
}
typedef Set_int  *_template_param_unused_363;
static struct _string_s _template__showLvar__pointer__tag_struct_Set_int_13__(struct _template__Lvar__pointer__tag_struct_Set_int_13__  * l)
{

  {
    if (((l)->_frozen))
    {
      {
        return ((((l)->_lattice)->_show)(((l)->_value)));
      }
    } else {
      ;
    }
    ((printf)("Error: Can't show a lvar before it is frozen!\n"));
    ((exit)(0));
    return ((strCharPointer)("<Lvar Value Unavailable>"));
  }
}
typedef Set_int  *_template_param_unused_367;
static signed int _template__freeThreshold__pointer__tag_struct_Set_int_13__(struct _template__ThresholdSet__pointer__tag_struct_Set_int_13__  * t)
{

  {
    ((free)(((t)->_a_sets)));
    ((free)((t)));
    return 1;
  }
}
typedef Set_int  *_template_param_unused_371;
static signed int _template__freeActivation__pointer__tag_struct_Set_int_13__(struct _template__ActivationSet__pointer__tag_struct_Set_int_13__  * act)
{

  {
    ((free)(((act)->_set)));
    ((free)((act)));
    return 1;
  }
}
signed int main(signed int  argc, char  * * argv)
{

  {
    struct _template__Lattice__pointer__tag_struct_Set_int_13__  *D = ((latticeint)());
    struct _template__Lvar__pointer__tag_struct_Set_int_13__  *set = ((_template__new__pointer__tag_struct_Set_int_13__)((D)));
    signed int res;
    ((res) = ((buildSet)(0, 35, (set))));
    struct _template__ThresholdSet__pointer__tag_struct_Set_int_13__  *t = ((_template__addThreshold__pointer__tag_struct_Set_int_13__)(((_template__newThresholdSet__pointer__tag_struct_Set_int_13__)((D), 1)), ((_template__addAct__pointer__tag_struct_Set_int_13__)(((_template__newActivationSet__pointer__tag_struct_Set_int_13__)((D), 20)), ((int_Empty)())))));
    struct _template__ActivationSet__pointer__tag_struct_Set_int_13__  *result = ((_template__get__pointer__tag_struct_Set_int_13__)((set), (t)));
    ((printf)("Act Set: %s\n", (((_template__showActivation__pointer__tag_struct_Set_int_13__)((result))).text)));
    Set_int  *frozen = ((_template__freeze__pointer__tag_struct_Set_int_13__)((set)));
    ((printf)("Frozen Lvar: %s\n", (((_template__showLvar__pointer__tag_struct_Set_int_13__)((set))).text)));
    ((free)((D)));
    ((free)((set)));
    ((_template__freeThreshold__pointer__tag_struct_Set_int_13__)((t)));
    ((_template__freeActivation__pointer__tag_struct_Set_int_13__)((result)));
    ((free)((frozen)));
    return 1;
  }
}
