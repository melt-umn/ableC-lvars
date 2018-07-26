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
extern signed long __sysconf(signed int  );
typedef __clock_t clock_t;
typedef __time_t time_t;
struct timespec {
  __time_t tv_sec;
  __syscall_slong_t tv_nsec;
  
};
struct tm {
  signed int tm_sec;
  signed int tm_min;
  signed int tm_hour;
  signed int tm_mday;
  signed int tm_mon;
  signed int tm_year;
  signed int tm_wday;
  signed int tm_yday;
  signed int tm_isdst;
  signed long __tm_gmtoff;
  const char  *__tm_zone;
  
};
extern clock_t clock(void) __attribute__((__nothrow__, __leaf__));
extern time_t time(time_t  * __timer) __attribute__((__nothrow__, __leaf__));
extern double difftime(time_t  __time1, time_t  __time0) __attribute__((__nothrow__, __leaf__)) __attribute__((__const__));
extern time_t mktime(struct tm  * __tp) __attribute__((__nothrow__, __leaf__));
extern size_t strftime(char  *__restrict  __s, size_t  __maxsize, const char  *__restrict  __format, const struct tm  *__restrict  __tp) __attribute__((__nothrow__, __leaf__));
extern struct tm  *gmtime(const time_t  * __timer) __attribute__((__nothrow__, __leaf__));
extern struct tm  *localtime(const time_t  * __timer) __attribute__((__nothrow__, __leaf__));
extern struct tm  *gmtime_r(const time_t  *__restrict  __timer, struct tm  *__restrict  __tp) __attribute__((__nothrow__, __leaf__));
extern struct tm  *localtime_r(const time_t  *__restrict  __timer, struct tm  *__restrict  __tp) __attribute__((__nothrow__, __leaf__));
extern char  *asctime(const struct tm  * __tp) __attribute__((__nothrow__, __leaf__));
extern char  *ctime(const time_t  * __timer) __attribute__((__nothrow__, __leaf__));
extern char  *asctime_r(const struct tm  *__restrict  __tp, char  *__restrict  __buf) __attribute__((__nothrow__, __leaf__));
extern char  *ctime_r(const time_t  *__restrict  __timer, char  *__restrict  __buf) __attribute__((__nothrow__, __leaf__));
extern char  *__tzname[2];
extern signed int __daylight;
extern signed long __timezone;
extern char  *tzname[2];
extern void tzset(void) __attribute__((__nothrow__, __leaf__));
extern signed int timespec_get(struct timespec  * __ts, signed int  __base) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
typedef __pid_t pid_t;
struct sched_param {
  signed int __sched_priority;
  
};
struct __sched_param {
  signed int __sched_priority;
  
};
typedef unsigned long __cpu_mask;
typedef struct  {
  __cpu_mask __bits[(1024 / ((8 * (sizeof(__cpu_mask)))))];
  
} cpu_set_t;
extern signed int __sched_cpucount(size_t  __setsize, const cpu_set_t  * __setp) __attribute__((__nothrow__, __leaf__));
extern cpu_set_t  *__sched_cpualloc(size_t  __count) __attribute__((__nothrow__, __leaf__));
extern void __sched_cpufree(cpu_set_t  * __set) __attribute__((__nothrow__, __leaf__));
extern signed int sched_setparam(__pid_t  __pid, const struct sched_param  * __param) __attribute__((__nothrow__, __leaf__));
extern signed int sched_getparam(__pid_t  __pid, struct sched_param  * __param) __attribute__((__nothrow__, __leaf__));
extern signed int sched_setscheduler(__pid_t  __pid, signed int  __policy, const struct sched_param  * __param) __attribute__((__nothrow__, __leaf__));
extern signed int sched_getscheduler(__pid_t  __pid) __attribute__((__nothrow__, __leaf__));
extern signed int sched_yield(void) __attribute__((__nothrow__, __leaf__));
extern signed int sched_get_priority_max(signed int  __algorithm) __attribute__((__nothrow__, __leaf__));
extern signed int sched_get_priority_min(signed int  __algorithm) __attribute__((__nothrow__, __leaf__));
extern signed int sched_rr_get_interval(__pid_t  __pid, struct timespec  * __t) __attribute__((__nothrow__, __leaf__));
typedef unsigned long pthread_t;
union pthread_attr_t {
  char __size[56];
  signed long __align;
  
};
typedef union pthread_attr_t pthread_attr_t;
typedef struct __pthread_internal_list {
  struct __pthread_internal_list  *__prev;
  struct __pthread_internal_list  *__next;
  
} __pthread_list_t;
typedef union  {
  struct __pthread_mutex_s {
    signed int __lock;
    unsigned int __count;
    signed int __owner;
    unsigned int __nusers;
    signed int __kind;
    signed short __spins;
    signed short __elision;
    __pthread_list_t __list;
    
  } __data;
  char __size[40];
  signed long __align;
  
} pthread_mutex_t;
typedef union  {
  char __size[4];
  signed int __align;
  
} pthread_mutexattr_t;
typedef union  {
  struct  {
    signed int __lock;
    unsigned int __futex;
    unsigned long long __total_seq;
    unsigned long long __wakeup_seq;
    unsigned long long __woken_seq;
    void  *__mutex;
    unsigned int __nwaiters;
    unsigned int __broadcast_seq;
    
  } __data;
  char __size[48];
  signed long long __align;
  
} pthread_cond_t;
typedef union  {
  char __size[4];
  signed int __align;
  
} pthread_condattr_t;
typedef unsigned int pthread_key_t;
typedef signed int pthread_once_t;
typedef signed long __jmp_buf[8];
enum  {
  PTHREAD_CREATE_JOINABLE,
  PTHREAD_CREATE_DETACHED
};
enum  {
  PTHREAD_MUTEX_TIMED_NP,
  PTHREAD_MUTEX_RECURSIVE_NP,
  PTHREAD_MUTEX_ERRORCHECK_NP,
  PTHREAD_MUTEX_ADAPTIVE_NP
};
enum  {
  PTHREAD_INHERIT_SCHED,
  PTHREAD_EXPLICIT_SCHED
};
enum  {
  PTHREAD_SCOPE_SYSTEM,
  PTHREAD_SCOPE_PROCESS
};
enum  {
  PTHREAD_PROCESS_PRIVATE,
  PTHREAD_PROCESS_SHARED
};
struct _pthread_cleanup_buffer {
  void ( *__routine)(void  * );
  void  *__arg;
  signed int __canceltype;
  struct _pthread_cleanup_buffer  *__prev;
  
};
enum  {
  PTHREAD_CANCEL_ENABLE,
  PTHREAD_CANCEL_DISABLE
};
enum  {
  PTHREAD_CANCEL_DEFERRED,
  PTHREAD_CANCEL_ASYNCHRONOUS
};
extern signed int pthread_create(pthread_t  *__restrict  __newthread, const pthread_attr_t  *__restrict  __attr, void  *( * __start_routine)(void  * ), void  *__restrict  __arg) __attribute__((__nothrow__)) __attribute__((__nonnull__(1, 3)));
extern void pthread_exit(void  * __retval) __attribute__((__noreturn__));
extern signed int pthread_join(pthread_t  __th, void  * * __thread_return);
extern signed int pthread_detach(pthread_t  __th) __attribute__((__nothrow__, __leaf__));
extern pthread_t pthread_self(void) __attribute__((__nothrow__, __leaf__)) __attribute__((__const__));
extern signed int pthread_equal(pthread_t  __thread1, pthread_t  __thread2) __attribute__((__nothrow__, __leaf__)) __attribute__((__const__));
extern signed int pthread_attr_init(pthread_attr_t  * __attr) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern signed int pthread_attr_destroy(pthread_attr_t  * __attr) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern signed int pthread_attr_getdetachstate(const pthread_attr_t  * __attr, signed int  * __detachstate) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1, 2)));
extern signed int pthread_attr_setdetachstate(pthread_attr_t  * __attr, signed int  __detachstate) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern signed int pthread_attr_getguardsize(const pthread_attr_t  * __attr, size_t  * __guardsize) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1, 2)));
extern signed int pthread_attr_setguardsize(pthread_attr_t  * __attr, size_t  __guardsize) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern signed int pthread_attr_getschedparam(const pthread_attr_t  *__restrict  __attr, struct sched_param  *__restrict  __param) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1, 2)));
extern signed int pthread_attr_setschedparam(pthread_attr_t  *__restrict  __attr, const struct sched_param  *__restrict  __param) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1, 2)));
extern signed int pthread_attr_getschedpolicy(const pthread_attr_t  *__restrict  __attr, signed int  *__restrict  __policy) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1, 2)));
extern signed int pthread_attr_setschedpolicy(pthread_attr_t  * __attr, signed int  __policy) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern signed int pthread_attr_getinheritsched(const pthread_attr_t  *__restrict  __attr, signed int  *__restrict  __inherit) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1, 2)));
extern signed int pthread_attr_setinheritsched(pthread_attr_t  * __attr, signed int  __inherit) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern signed int pthread_attr_getscope(const pthread_attr_t  *__restrict  __attr, signed int  *__restrict  __scope) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1, 2)));
extern signed int pthread_attr_setscope(pthread_attr_t  * __attr, signed int  __scope) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern signed int pthread_attr_getstackaddr(const pthread_attr_t  *__restrict  __attr, void  * *__restrict  __stackaddr) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1, 2))) __attribute__((__deprecated__));
extern signed int pthread_attr_setstackaddr(pthread_attr_t  * __attr, void  * __stackaddr) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1))) __attribute__((__deprecated__));
extern signed int pthread_attr_getstacksize(const pthread_attr_t  *__restrict  __attr, size_t  *__restrict  __stacksize) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1, 2)));
extern signed int pthread_attr_setstacksize(pthread_attr_t  * __attr, size_t  __stacksize) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern signed int pthread_setschedparam(pthread_t  __target_thread, signed int  __policy, const struct sched_param  * __param) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(3)));
extern signed int pthread_getschedparam(pthread_t  __target_thread, signed int  *__restrict  __policy, struct sched_param  *__restrict  __param) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(2, 3)));
extern signed int pthread_setschedprio(pthread_t  __target_thread, signed int  __prio) __attribute__((__nothrow__, __leaf__));
extern signed int pthread_once(pthread_once_t  * __once_control, void ( * __init_routine)(void)) __attribute__((__nonnull__(1, 2)));
extern signed int pthread_setcancelstate(signed int  __state, signed int  * __oldstate);
extern signed int pthread_setcanceltype(signed int  __type, signed int  * __oldtype);
extern signed int pthread_cancel(pthread_t  __th);
extern void pthread_testcancel(void);
typedef struct  {
  struct  {
    __jmp_buf __cancel_jmp_buf;
    signed int __mask_was_saved;
    
  } __cancel_jmp_buf[1];
  void  *__pad[4];
  
} __pthread_unwind_buf_t __attribute__((__aligned__));
struct __pthread_cleanup_frame {
  void ( *__cancel_routine)(void  * );
  void  *__cancel_arg;
  signed int __do_it;
  signed int __cancel_type;
  
};
extern void __pthread_register_cancel(__pthread_unwind_buf_t  * __buf);
extern void __pthread_unregister_cancel(__pthread_unwind_buf_t  * __buf);
extern void __pthread_unwind_next(__pthread_unwind_buf_t  * __buf) __attribute__((__noreturn__)) __attribute__((__weak__));
struct __jmp_buf_tag;
extern signed int __sigsetjmp(struct __jmp_buf_tag  * __env, signed int  __savemask) __attribute__((__nothrow__));
extern signed int pthread_mutex_init(pthread_mutex_t  * __mutex, const pthread_mutexattr_t  * __mutexattr) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern signed int pthread_mutex_destroy(pthread_mutex_t  * __mutex) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern signed int pthread_mutex_trylock(pthread_mutex_t  * __mutex) __attribute__((__nothrow__)) __attribute__((__nonnull__(1)));
extern signed int pthread_mutex_lock(pthread_mutex_t  * __mutex) __attribute__((__nothrow__)) __attribute__((__nonnull__(1)));
extern signed int pthread_mutex_unlock(pthread_mutex_t  * __mutex) __attribute__((__nothrow__)) __attribute__((__nonnull__(1)));
extern signed int pthread_mutex_getprioceiling(const pthread_mutex_t  *__restrict  __mutex, signed int  *__restrict  __prioceiling) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1, 2)));
extern signed int pthread_mutex_setprioceiling(pthread_mutex_t  *__restrict  __mutex, signed int  __prioceiling, signed int  *__restrict  __old_ceiling) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1, 3)));
extern signed int pthread_mutexattr_init(pthread_mutexattr_t  * __attr) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern signed int pthread_mutexattr_destroy(pthread_mutexattr_t  * __attr) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern signed int pthread_mutexattr_getpshared(const pthread_mutexattr_t  *__restrict  __attr, signed int  *__restrict  __pshared) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1, 2)));
extern signed int pthread_mutexattr_setpshared(pthread_mutexattr_t  * __attr, signed int  __pshared) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern signed int pthread_mutexattr_getprotocol(const pthread_mutexattr_t  *__restrict  __attr, signed int  *__restrict  __protocol) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1, 2)));
extern signed int pthread_mutexattr_setprotocol(pthread_mutexattr_t  * __attr, signed int  __protocol) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern signed int pthread_mutexattr_getprioceiling(const pthread_mutexattr_t  *__restrict  __attr, signed int  *__restrict  __prioceiling) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1, 2)));
extern signed int pthread_mutexattr_setprioceiling(pthread_mutexattr_t  * __attr, signed int  __prioceiling) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern signed int pthread_cond_init(pthread_cond_t  *__restrict  __cond, const pthread_condattr_t  *__restrict  __cond_attr) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern signed int pthread_cond_destroy(pthread_cond_t  * __cond) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern signed int pthread_cond_signal(pthread_cond_t  * __cond) __attribute__((__nothrow__)) __attribute__((__nonnull__(1)));
extern signed int pthread_cond_broadcast(pthread_cond_t  * __cond) __attribute__((__nothrow__)) __attribute__((__nonnull__(1)));
extern signed int pthread_cond_wait(pthread_cond_t  *__restrict  __cond, pthread_mutex_t  *__restrict  __mutex) __attribute__((__nonnull__(1, 2)));
extern signed int pthread_cond_timedwait(pthread_cond_t  *__restrict  __cond, pthread_mutex_t  *__restrict  __mutex, const struct timespec  *__restrict  __abstime) __attribute__((__nonnull__(1, 2, 3)));
extern signed int pthread_condattr_init(pthread_condattr_t  * __attr) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern signed int pthread_condattr_destroy(pthread_condattr_t  * __attr) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern signed int pthread_condattr_getpshared(const pthread_condattr_t  *__restrict  __attr, signed int  *__restrict  __pshared) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1, 2)));
extern signed int pthread_condattr_setpshared(pthread_condattr_t  * __attr, signed int  __pshared) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern signed int pthread_key_create(pthread_key_t  * __key, void ( * __destr_function)(void  * )) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern signed int pthread_key_delete(pthread_key_t  __key) __attribute__((__nothrow__, __leaf__));
extern void  *pthread_getspecific(pthread_key_t  __key) __attribute__((__nothrow__, __leaf__));
extern signed int pthread_setspecific(pthread_key_t  __key, const void  * __pointer) __attribute__((__nothrow__, __leaf__));
extern signed int pthread_atfork(void ( * __prepare)(void), void ( * __parent)(void), void ( * __child)(void)) __attribute__((__nothrow__, __leaf__));
signed int _lvarCheckValue = 1;
typedef __loff_t loff_t;
typedef __ino_t ino_t;
typedef __dev_t dev_t;
typedef __gid_t gid_t;
typedef __mode_t mode_t;
typedef __nlink_t nlink_t;
typedef __uid_t uid_t;
typedef __off_t off_t;
typedef __ssize_t ssize_t;
typedef signed int int8_t __attribute__((__mode__(__QI__)));
typedef signed int int16_t __attribute__((__mode__(__HI__)));
typedef signed int int32_t __attribute__((__mode__(__SI__)));
typedef signed int int64_t __attribute__((__mode__(__DI__)));
typedef unsigned int u_int8_t __attribute__((__mode__(__QI__)));
typedef unsigned int u_int16_t __attribute__((__mode__(__HI__)));
typedef unsigned int u_int32_t __attribute__((__mode__(__SI__)));
typedef unsigned int u_int64_t __attribute__((__mode__(__DI__)));
typedef signed int register_t __attribute__((__mode__(__word__)));
typedef __blkcnt_t blkcnt_t;
typedef __fsblkcnt_t fsblkcnt_t;
typedef __fsfilcnt_t fsfilcnt_t;
static const char  *ident_cilk_sysdep_h __attribute__((__unused__)) = "$HeadURL: https://bradley.csail.mit.edu/svn/repos/cilk/5.4.3/runtime/cilk-sysdep.h.in $ $LastChangedBy: bradley $ $Rev: 2311 $ $Date: 2005-07-13 17:38:21 -0400 (Wed, 13 Jul 2005) $";
static inline void CILK_MB(void)
{

  {
    asm volatile ("mfence": : : "memory");
  }
}
static inline signed int Cilk_xchg(volatile signed int  * ptr, signed int  x)
{

  {
    asm ("xchgl %0,%1": "=r" ((x)): "m" ((*((ptr)))), "0" ((x)): "memory");
    return (x);
  }
}
struct timeval {
  __time_t tv_sec;
  __suseconds_t tv_usec;
  
};
typedef signed int __sig_atomic_t;
typedef struct  {
  unsigned long __val[((1024 / ((8 * (sizeof(unsigned long))))))];
  
} __sigset_t;
typedef __sigset_t sigset_t;
typedef __suseconds_t suseconds_t;
typedef signed long __fd_mask;
typedef struct  {
  __fd_mask __fds_bits[(1024 / ((8 * ((signed int)(sizeof(__fd_mask))))))];
  
} fd_set;
extern signed int select(signed int  __nfds, fd_set  *__restrict  __readfds, fd_set  *__restrict  __writefds, fd_set  *__restrict  __exceptfds, struct timeval  *__restrict  __timeout);
typedef void  *__restrict __timezone_ptr_t;
extern signed int gettimeofday(struct timeval  *__restrict  __tv, __timezone_ptr_t  __tz) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
enum __itimer_which {
  ITIMER_REAL = 0,
  ITIMER_VIRTUAL = 1,
  ITIMER_PROF = 2
};
struct itimerval {
  struct timeval it_interval;
  struct timeval it_value;
  
};
typedef signed int __itimer_which_t;
extern signed int getitimer(__itimer_which_t  __which, struct itimerval  * __value) __attribute__((__nothrow__, __leaf__));
extern signed int setitimer(__itimer_which_t  __which, const struct itimerval  *__restrict  __new, struct itimerval  *__restrict  __old) __attribute__((__nothrow__, __leaf__));
extern signed int utimes(const char  * __file, const struct timeval  __tvp[2]) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern signed int access(const char  * __name, signed int  __type) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern __off_t lseek(signed int  __fd, __off_t  __offset, signed int  __whence) __attribute__((__nothrow__, __leaf__));
extern signed int close(signed int  __fd);
extern ssize_t read(signed int  __fd, void  * __buf, size_t  __nbytes);
extern ssize_t write(signed int  __fd, const void  * __buf, size_t  __n);
extern signed int pipe(signed int  __pipedes[2]) __attribute__((__nothrow__, __leaf__));
extern unsigned int alarm(unsigned int  __seconds) __attribute__((__nothrow__, __leaf__));
extern unsigned int sleep(unsigned int  __seconds);
extern signed int pause(void);
extern signed int chown(const char  * __file, __uid_t  __owner, __gid_t  __group) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern signed int chdir(const char  * __path) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern char  *getcwd(char  * __buf, size_t  __size) __attribute__((__nothrow__, __leaf__));
extern signed int dup(signed int  __fd) __attribute__((__nothrow__, __leaf__));
extern signed int dup2(signed int  __fd, signed int  __fd2) __attribute__((__nothrow__, __leaf__));
extern char  * *__environ;
extern signed int execve(const char  * __path, char  *const  __argv[], char  *const  __envp[]) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1, 2)));
extern signed int execv(const char  * __path, char  *const  __argv[]) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1, 2)));
extern signed int execle(const char  * __path, const char  * __arg, ...) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1, 2)));
extern signed int execl(const char  * __path, const char  * __arg, ...) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1, 2)));
extern signed int execvp(const char  * __file, char  *const  __argv[]) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1, 2)));
extern signed int execlp(const char  * __file, const char  * __arg, ...) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1, 2)));
extern void _exit(signed int  __status) __attribute__((__noreturn__));
enum  {
  _PC_LINK_MAX,
  _PC_MAX_CANON,
  _PC_MAX_INPUT,
  _PC_NAME_MAX,
  _PC_PATH_MAX,
  _PC_PIPE_BUF,
  _PC_CHOWN_RESTRICTED,
  _PC_NO_TRUNC,
  _PC_VDISABLE,
  _PC_SYNC_IO,
  _PC_ASYNC_IO,
  _PC_PRIO_IO,
  _PC_SOCK_MAXBUF,
  _PC_FILESIZEBITS,
  _PC_REC_INCR_XFER_SIZE,
  _PC_REC_MAX_XFER_SIZE,
  _PC_REC_MIN_XFER_SIZE,
  _PC_REC_XFER_ALIGN,
  _PC_ALLOC_SIZE_MIN,
  _PC_SYMLINK_MAX,
  _PC_2_SYMLINKS
};
enum  {
  _SC_ARG_MAX,
  _SC_CHILD_MAX,
  _SC_CLK_TCK,
  _SC_NGROUPS_MAX,
  _SC_OPEN_MAX,
  _SC_STREAM_MAX,
  _SC_TZNAME_MAX,
  _SC_JOB_CONTROL,
  _SC_SAVED_IDS,
  _SC_REALTIME_SIGNALS,
  _SC_PRIORITY_SCHEDULING,
  _SC_TIMERS,
  _SC_ASYNCHRONOUS_IO,
  _SC_PRIORITIZED_IO,
  _SC_SYNCHRONIZED_IO,
  _SC_FSYNC,
  _SC_MAPPED_FILES,
  _SC_MEMLOCK,
  _SC_MEMLOCK_RANGE,
  _SC_MEMORY_PROTECTION,
  _SC_MESSAGE_PASSING,
  _SC_SEMAPHORES,
  _SC_SHARED_MEMORY_OBJECTS,
  _SC_AIO_LISTIO_MAX,
  _SC_AIO_MAX,
  _SC_AIO_PRIO_DELTA_MAX,
  _SC_DELAYTIMER_MAX,
  _SC_MQ_OPEN_MAX,
  _SC_MQ_PRIO_MAX,
  _SC_VERSION,
  _SC_PAGESIZE,
  _SC_RTSIG_MAX,
  _SC_SEM_NSEMS_MAX,
  _SC_SEM_VALUE_MAX,
  _SC_SIGQUEUE_MAX,
  _SC_TIMER_MAX,
  _SC_BC_BASE_MAX,
  _SC_BC_DIM_MAX,
  _SC_BC_SCALE_MAX,
  _SC_BC_STRING_MAX,
  _SC_COLL_WEIGHTS_MAX,
  _SC_EQUIV_CLASS_MAX,
  _SC_EXPR_NEST_MAX,
  _SC_LINE_MAX,
  _SC_RE_DUP_MAX,
  _SC_CHARCLASS_NAME_MAX,
  _SC_2_VERSION,
  _SC_2_C_BIND,
  _SC_2_C_DEV,
  _SC_2_FORT_DEV,
  _SC_2_FORT_RUN,
  _SC_2_SW_DEV,
  _SC_2_LOCALEDEF,
  _SC_PII,
  _SC_PII_XTI,
  _SC_PII_SOCKET,
  _SC_PII_INTERNET,
  _SC_PII_OSI,
  _SC_POLL,
  _SC_SELECT,
  _SC_UIO_MAXIOV,
  _SC_IOV_MAX = (_SC_UIO_MAXIOV),
  _SC_PII_INTERNET_STREAM,
  _SC_PII_INTERNET_DGRAM,
  _SC_PII_OSI_COTS,
  _SC_PII_OSI_CLTS,
  _SC_PII_OSI_M,
  _SC_T_IOV_MAX,
  _SC_THREADS,
  _SC_THREAD_SAFE_FUNCTIONS,
  _SC_GETGR_R_SIZE_MAX,
  _SC_GETPW_R_SIZE_MAX,
  _SC_LOGIN_NAME_MAX,
  _SC_TTY_NAME_MAX,
  _SC_THREAD_DESTRUCTOR_ITERATIONS,
  _SC_THREAD_KEYS_MAX,
  _SC_THREAD_STACK_MIN,
  _SC_THREAD_THREADS_MAX,
  _SC_THREAD_ATTR_STACKADDR,
  _SC_THREAD_ATTR_STACKSIZE,
  _SC_THREAD_PRIORITY_SCHEDULING,
  _SC_THREAD_PRIO_INHERIT,
  _SC_THREAD_PRIO_PROTECT,
  _SC_THREAD_PROCESS_SHARED,
  _SC_NPROCESSORS_CONF,
  _SC_NPROCESSORS_ONLN,
  _SC_PHYS_PAGES,
  _SC_AVPHYS_PAGES,
  _SC_ATEXIT_MAX,
  _SC_PASS_MAX,
  _SC_XOPEN_VERSION,
  _SC_XOPEN_XCU_VERSION,
  _SC_XOPEN_UNIX,
  _SC_XOPEN_CRYPT,
  _SC_XOPEN_ENH_I18N,
  _SC_XOPEN_SHM,
  _SC_2_CHAR_TERM,
  _SC_2_C_VERSION,
  _SC_2_UPE,
  _SC_XOPEN_XPG2,
  _SC_XOPEN_XPG3,
  _SC_XOPEN_XPG4,
  _SC_CHAR_BIT,
  _SC_CHAR_MAX,
  _SC_CHAR_MIN,
  _SC_INT_MAX,
  _SC_INT_MIN,
  _SC_LONG_BIT,
  _SC_WORD_BIT,
  _SC_MB_LEN_MAX,
  _SC_NZERO,
  _SC_SSIZE_MAX,
  _SC_SCHAR_MAX,
  _SC_SCHAR_MIN,
  _SC_SHRT_MAX,
  _SC_SHRT_MIN,
  _SC_UCHAR_MAX,
  _SC_UINT_MAX,
  _SC_ULONG_MAX,
  _SC_USHRT_MAX,
  _SC_NL_ARGMAX,
  _SC_NL_LANGMAX,
  _SC_NL_MSGMAX,
  _SC_NL_NMAX,
  _SC_NL_SETMAX,
  _SC_NL_TEXTMAX,
  _SC_XBS5_ILP32_OFF32,
  _SC_XBS5_ILP32_OFFBIG,
  _SC_XBS5_LP64_OFF64,
  _SC_XBS5_LPBIG_OFFBIG,
  _SC_XOPEN_LEGACY,
  _SC_XOPEN_REALTIME,
  _SC_XOPEN_REALTIME_THREADS,
  _SC_ADVISORY_INFO,
  _SC_BARRIERS,
  _SC_BASE,
  _SC_C_LANG_SUPPORT,
  _SC_C_LANG_SUPPORT_R,
  _SC_CLOCK_SELECTION,
  _SC_CPUTIME,
  _SC_THREAD_CPUTIME,
  _SC_DEVICE_IO,
  _SC_DEVICE_SPECIFIC,
  _SC_DEVICE_SPECIFIC_R,
  _SC_FD_MGMT,
  _SC_FIFO,
  _SC_PIPE,
  _SC_FILE_ATTRIBUTES,
  _SC_FILE_LOCKING,
  _SC_FILE_SYSTEM,
  _SC_MONOTONIC_CLOCK,
  _SC_MULTI_PROCESS,
  _SC_SINGLE_PROCESS,
  _SC_NETWORKING,
  _SC_READER_WRITER_LOCKS,
  _SC_SPIN_LOCKS,
  _SC_REGEXP,
  _SC_REGEX_VERSION,
  _SC_SHELL,
  _SC_SIGNALS,
  _SC_SPAWN,
  _SC_SPORADIC_SERVER,
  _SC_THREAD_SPORADIC_SERVER,
  _SC_SYSTEM_DATABASE,
  _SC_SYSTEM_DATABASE_R,
  _SC_TIMEOUTS,
  _SC_TYPED_MEMORY_OBJECTS,
  _SC_USER_GROUPS,
  _SC_USER_GROUPS_R,
  _SC_2_PBS,
  _SC_2_PBS_ACCOUNTING,
  _SC_2_PBS_LOCATE,
  _SC_2_PBS_MESSAGE,
  _SC_2_PBS_TRACK,
  _SC_SYMLOOP_MAX,
  _SC_STREAMS,
  _SC_2_PBS_CHECKPOINT,
  _SC_V6_ILP32_OFF32,
  _SC_V6_ILP32_OFFBIG,
  _SC_V6_LP64_OFF64,
  _SC_V6_LPBIG_OFFBIG,
  _SC_HOST_NAME_MAX,
  _SC_TRACE,
  _SC_TRACE_EVENT_FILTER,
  _SC_TRACE_INHERIT,
  _SC_TRACE_LOG,
  _SC_LEVEL1_ICACHE_SIZE,
  _SC_LEVEL1_ICACHE_ASSOC,
  _SC_LEVEL1_ICACHE_LINESIZE,
  _SC_LEVEL1_DCACHE_SIZE,
  _SC_LEVEL1_DCACHE_ASSOC,
  _SC_LEVEL1_DCACHE_LINESIZE,
  _SC_LEVEL2_CACHE_SIZE,
  _SC_LEVEL2_CACHE_ASSOC,
  _SC_LEVEL2_CACHE_LINESIZE,
  _SC_LEVEL3_CACHE_SIZE,
  _SC_LEVEL3_CACHE_ASSOC,
  _SC_LEVEL3_CACHE_LINESIZE,
  _SC_LEVEL4_CACHE_SIZE,
  _SC_LEVEL4_CACHE_ASSOC,
  _SC_LEVEL4_CACHE_LINESIZE,
  _SC_IPV6 = ((_SC_LEVEL1_ICACHE_SIZE) + 50),
  _SC_RAW_SOCKETS,
  _SC_V7_ILP32_OFF32,
  _SC_V7_ILP32_OFFBIG,
  _SC_V7_LP64_OFF64,
  _SC_V7_LPBIG_OFFBIG,
  _SC_SS_REPL_MAX,
  _SC_TRACE_EVENT_NAME_MAX,
  _SC_TRACE_NAME_MAX,
  _SC_TRACE_SYS_MAX,
  _SC_TRACE_USER_EVENT_MAX,
  _SC_XOPEN_STREAMS,
  _SC_THREAD_ROBUST_PRIO_INHERIT,
  _SC_THREAD_ROBUST_PRIO_PROTECT
};
enum  {
  _CS_PATH,
  _CS_V6_WIDTH_RESTRICTED_ENVS,
  _CS_GNU_LIBC_VERSION,
  _CS_GNU_LIBPTHREAD_VERSION,
  _CS_V5_WIDTH_RESTRICTED_ENVS,
  _CS_V7_WIDTH_RESTRICTED_ENVS,
  _CS_LFS_CFLAGS = 1000,
  _CS_LFS_LDFLAGS,
  _CS_LFS_LIBS,
  _CS_LFS_LINTFLAGS,
  _CS_LFS64_CFLAGS,
  _CS_LFS64_LDFLAGS,
  _CS_LFS64_LIBS,
  _CS_LFS64_LINTFLAGS,
  _CS_XBS5_ILP32_OFF32_CFLAGS = 1100,
  _CS_XBS5_ILP32_OFF32_LDFLAGS,
  _CS_XBS5_ILP32_OFF32_LIBS,
  _CS_XBS5_ILP32_OFF32_LINTFLAGS,
  _CS_XBS5_ILP32_OFFBIG_CFLAGS,
  _CS_XBS5_ILP32_OFFBIG_LDFLAGS,
  _CS_XBS5_ILP32_OFFBIG_LIBS,
  _CS_XBS5_ILP32_OFFBIG_LINTFLAGS,
  _CS_XBS5_LP64_OFF64_CFLAGS,
  _CS_XBS5_LP64_OFF64_LDFLAGS,
  _CS_XBS5_LP64_OFF64_LIBS,
  _CS_XBS5_LP64_OFF64_LINTFLAGS,
  _CS_XBS5_LPBIG_OFFBIG_CFLAGS,
  _CS_XBS5_LPBIG_OFFBIG_LDFLAGS,
  _CS_XBS5_LPBIG_OFFBIG_LIBS,
  _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS,
  _CS_POSIX_V6_ILP32_OFF32_CFLAGS,
  _CS_POSIX_V6_ILP32_OFF32_LDFLAGS,
  _CS_POSIX_V6_ILP32_OFF32_LIBS,
  _CS_POSIX_V6_ILP32_OFF32_LINTFLAGS,
  _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS,
  _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS,
  _CS_POSIX_V6_ILP32_OFFBIG_LIBS,
  _CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS,
  _CS_POSIX_V6_LP64_OFF64_CFLAGS,
  _CS_POSIX_V6_LP64_OFF64_LDFLAGS,
  _CS_POSIX_V6_LP64_OFF64_LIBS,
  _CS_POSIX_V6_LP64_OFF64_LINTFLAGS,
  _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS,
  _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS,
  _CS_POSIX_V6_LPBIG_OFFBIG_LIBS,
  _CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS,
  _CS_POSIX_V7_ILP32_OFF32_CFLAGS,
  _CS_POSIX_V7_ILP32_OFF32_LDFLAGS,
  _CS_POSIX_V7_ILP32_OFF32_LIBS,
  _CS_POSIX_V7_ILP32_OFF32_LINTFLAGS,
  _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS,
  _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS,
  _CS_POSIX_V7_ILP32_OFFBIG_LIBS,
  _CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS,
  _CS_POSIX_V7_LP64_OFF64_CFLAGS,
  _CS_POSIX_V7_LP64_OFF64_LDFLAGS,
  _CS_POSIX_V7_LP64_OFF64_LIBS,
  _CS_POSIX_V7_LP64_OFF64_LINTFLAGS,
  _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS,
  _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS,
  _CS_POSIX_V7_LPBIG_OFFBIG_LIBS,
  _CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS,
  _CS_V6_ENV,
  _CS_V7_ENV
};
extern signed long pathconf(const char  * __path, signed int  __name) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern signed long fpathconf(signed int  __fd, signed int  __name) __attribute__((__nothrow__, __leaf__));
extern signed long sysconf(signed int  __name) __attribute__((__nothrow__, __leaf__));
extern __pid_t getpid(void) __attribute__((__nothrow__, __leaf__));
extern __pid_t getppid(void) __attribute__((__nothrow__, __leaf__));
extern __pid_t getpgrp(void) __attribute__((__nothrow__, __leaf__));
extern __pid_t __getpgid(__pid_t  __pid) __attribute__((__nothrow__, __leaf__));
extern signed int setpgid(__pid_t  __pid, __pid_t  __pgid) __attribute__((__nothrow__, __leaf__));
extern __pid_t setsid(void) __attribute__((__nothrow__, __leaf__));
extern __uid_t getuid(void) __attribute__((__nothrow__, __leaf__));
extern __uid_t geteuid(void) __attribute__((__nothrow__, __leaf__));
extern __gid_t getgid(void) __attribute__((__nothrow__, __leaf__));
extern __gid_t getegid(void) __attribute__((__nothrow__, __leaf__));
extern signed int getgroups(signed int  __size, __gid_t  __list[]) __attribute__((__nothrow__, __leaf__));
extern signed int setuid(__uid_t  __uid) __attribute__((__nothrow__, __leaf__));
extern signed int setgid(__gid_t  __gid) __attribute__((__nothrow__, __leaf__));
extern __pid_t fork(void) __attribute__((__nothrow__));
extern char  *ttyname(signed int  __fd) __attribute__((__nothrow__, __leaf__));
extern signed int ttyname_r(signed int  __fd, char  * __buf, size_t  __buflen) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(2)));
extern signed int isatty(signed int  __fd) __attribute__((__nothrow__, __leaf__));
extern signed int link(const char  * __from, const char  * __to) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1, 2)));
extern signed int unlink(const char  * __name) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern signed int rmdir(const char  * __path) __attribute__((__nothrow__, __leaf__)) __attribute__((__nonnull__(1)));
extern __pid_t tcgetpgrp(signed int  __fd) __attribute__((__nothrow__, __leaf__));
extern signed int tcsetpgrp(signed int  __fd, __pid_t  __pgrp_id) __attribute__((__nothrow__, __leaf__));
extern char  *getlogin(void);
extern signed int fsync(signed int  __fd);
typedef signed long long Cilk_time;
static inline Cilk_time Cilk_get_time(void)
{

  {
    struct timeval tv;
    ((gettimeofday)((&(tv)), 0));
    return (((((Cilk_time)((tv).tv_sec)) * 1000000LL) + ((Cilk_time)((tv).tv_usec))));
  }
}
static inline double Cilk_time_to_sec(Cilk_time  t)
{

  {
    return (((double)(t)) * 1.0E-6);
  }
}
static inline Cilk_time Cilk_get_wall_time(void)
{

  {
    return ((Cilk_get_time)());
  }
}
static inline double Cilk_wall_time_to_sec(Cilk_time  t)
{

  {
    return ((Cilk_time_to_sec)((t)));
  }
}
static const char  *cilk_h_ident __attribute__((__unused__)) = "$HeadURL: https://bradley.csail.mit.edu/svn/repos/cilk/5.4.3/runtime/cilk.h $ $LastChangedBy: bradley $ $Rev: 2672 $ $Date: 2005-12-20 13:30:02 -0500 (Tue, 20 Dec 2005) $";
static const char  *ident_cilk_conf_h __attribute__((__unused__)) = "$HeadURL: https://bradley.csail.mit.edu/svn/repos/cilk/5.4.3/runtime/cilk-conf.h $ $LastChangedBy: bradley $ $Rev: 1465 $ $Date: 2004-08-02 06:31:06 -0400 (Mon, 02 Aug 2004) $";
typedef struct  {
  signed int size;
  ptrdiff_t index;
  void ( *inlet)();
  signed int argsize;
  ptrdiff_t argindex;
  
} CilkProcInfo;
struct cilk_alloca_header {
  struct cilk_alloca_header  *next;
  size_t size;
  
};
typedef void ( *HookT)(void);
typedef struct hook {
  HookT fn;
  struct hook  *next;
  
} HookList;
extern void Cilk_add_hook(HookList  * * listp, HookT  fn);
extern void Cilk_run_hooks(HookList  * list);
extern HookList  *Cilk_init_global_hooks;
extern HookList  *Cilk_init_per_worker_hooks;
typedef struct  {
  signed int entry;
  void  *receiver;
  CilkProcInfo  *sig;
  struct cilk_alloca_header  *alloca_h;
  
} CilkStackFrame;
typedef CilkStackFrame  * *CilkStack;
typedef struct  {
  volatile CilkStackFrame  * *head,  * *tail;
  volatile CilkStackFrame  * *exception;
  CilkStack stack;
  char __dummy[64];
  
} CilkClosureCache;
struct Cilk_im_descriptor {
  void  *free_list;
  signed int length;
  signed int count;
  
};
struct Cilk_im_stats {
  signed int used;
  signed int nmalloc;
  signed int in_free_lists;
  signed int length[9];
  char __dummy[64];
  
};
typedef struct Closure_s Closure;
typedef struct Cilk_options_s Cilk_options;
typedef struct  {
  struct Cilk_im_stats  *im_info;
  Cilk_options  *options;
  const char  *assertion_failed_msg;
  const char  *stack_overflow_msg;
  signed int active_size;
  signed int pthread_stacksize;
  void  *infofile;
  unsigned int num_threads;
  unsigned int num_steals;
  struct ReadyDeque  *deques;
  Cilk_time start_time;
  Closure  *invoke_main;
  HookList  *Cilk_init_global_hooks;
  HookList  *Cilk_init_per_worker_hooks;
  
} CilkReadOnlyParams;
typedef struct CilkGlobalState_s CilkGlobalState;
typedef struct  {
  CilkReadOnlyParams  *Cilk_RO_params;
  CilkGlobalState  *Cilk_global_state;
  
} CilkContext;
typedef struct  {
  CilkClosureCache cache;
  signed int self;
  struct Cilk_im_descriptor im_descriptor[9];
  size_t stackdepth;
  Cilk_time last_cp_time;
  Cilk_time cp_hack;
  Cilk_time work_hack;
  Cilk_time user_work;
  Cilk_time user_critical_path;
  unsigned int rand_next;
  signed int abort_flag;
  signed int barrier_direction;
  char __dummy[64];
  CilkContext  *context;
  
} CilkWorkerState;
typedef struct  {
  CilkContext  *context;
  signed int id;
  
} CilkChildParams;
extern void Cilk_dprintf(CilkWorkerState  *const  ws, const char  * fmt, ...);
extern void Cilk_die_internal(CilkContext  *const  context, CilkWorkerState  *const  ws, const char  * fmt, ...);
extern void Cilk_unalloca_internal(CilkWorkerState  *const  ws, CilkStackFrame  * f);
extern void  *Cilk_internal_malloc(CilkWorkerState  *const  ws, size_t  );
extern void Cilk_internal_free(CilkWorkerState  *const  ws, void  * p, size_t  size);
extern CilkContext  *Cilk_init(signed int  * argc, char  * * argv);
extern void Cilk_terminate(CilkContext  *const  context);
static inline Cilk_time Cilk_get_elapsed_time(CilkWorkerState  *const  ws)
{

  {
    Cilk_time then = ((ws)->last_cp_time);
    Cilk_time now = ((Cilk_get_time)());
    ;
    (((ws)->last_cp_time) = (now));
    return ((now) - (then));
  }
}
static inline signed int Cilk_internal_malloc_canonicalize(size_t  size)
{

  {
    if ((((size) <= 16) && (16 >= 64)))
    {
      return 16;
    } else {
      ;
    }
    ;
    if ((((size) <= 32) && (32 >= 64)))
    {
      return 32;
    } else {
      ;
    }
    ;
    if ((((size) <= 64) && (64 >= 64)))
    {
      return 64;
    } else {
      ;
    }
    ;
    if ((((size) <= 128) && (128 >= 64)))
    {
      return 128;
    } else {
      ;
    }
    ;
    if ((((size) <= 256) && (256 >= 64)))
    {
      return 256;
    } else {
      ;
    }
    ;
    if ((((size) <= 512) && (512 >= 64)))
    {
      return 512;
    } else {
      ;
    }
    ;
    if ((((size) <= 1024) && (1024 >= 64)))
    {
      return 1024;
    } else {
      ;
    }
    ;
    if ((((size) <= 2048) && (2048 >= 64)))
    {
      return 2048;
    } else {
      ;
    }
    ;
    if ((((size) <= 4096) && (4096 >= 64)))
    {
      return 4096;
    } else {
      ;
    }
    ;
    return (-1);
  }
}
static inline signed int Cilk_internal_malloc_size_to_bucket(size_t  size)
{

  {
    if ((((size) <= 16) && (16 >= 64)))
    {
      return 0;
    } else {
      ;
    }
    ;
    if ((((size) <= 32) && (32 >= 64)))
    {
      return 1;
    } else {
      ;
    }
    ;
    if ((((size) <= 64) && (64 >= 64)))
    {
      return 2;
    } else {
      ;
    }
    ;
    if ((((size) <= 128) && (128 >= 64)))
    {
      return 3;
    } else {
      ;
    }
    ;
    if ((((size) <= 256) && (256 >= 64)))
    {
      return 4;
    } else {
      ;
    }
    ;
    if ((((size) <= 512) && (512 >= 64)))
    {
      return 5;
    } else {
      ;
    }
    ;
    if ((((size) <= 1024) && (1024 >= 64)))
    {
      return 6;
    } else {
      ;
    }
    ;
    if ((((size) <= 2048) && (2048 >= 64)))
    {
      return 7;
    } else {
      ;
    }
    ;
    if ((((size) <= 4096) && (4096 >= 64)))
    {
      return 8;
    } else {
      ;
    }
    ;
    return (-1);
  }
}
static inline signed int Cilk_internal_malloc_bucket_to_size(signed int  b)
{

  {
    if ((0 == (b)))
    {
      return 16;
    } else {
      ;
    }
    ;
    if ((1 == (b)))
    {
      return 32;
    } else {
      ;
    }
    ;
    if ((2 == (b)))
    {
      return 64;
    } else {
      ;
    }
    ;
    if ((3 == (b)))
    {
      return 128;
    } else {
      ;
    }
    ;
    if ((4 == (b)))
    {
      return 256;
    } else {
      ;
    }
    ;
    if ((5 == (b)))
    {
      return 512;
    } else {
      ;
    }
    ;
    if ((6 == (b)))
    {
      return 1024;
    } else {
      ;
    }
    ;
    if ((7 == (b)))
    {
      return 2048;
    } else {
      ;
    }
    ;
    if ((8 == (b)))
    {
      return 4096;
    } else {
      ;
    }
    ;
    return (-1);
  }
}
static inline void Cilk_fence(void)
{

  {
    ((CILK_MB)());
  }
}
static inline void Cilk_membar_StoreStore(void)
{

  {
    asm volatile ("": : : "memory");
  }
}
static inline void Cilk_membar_StoreLoad(void)
{

  {
    ((CILK_MB)());
  }
}
extern signed int Cilk_sync(CilkWorkerState  *const  ws);
extern signed int Cilk_exception_handler(CilkWorkerState  *const  ws, void  * , signed int  );
extern void Cilk_set_result(CilkWorkerState  *const  ws, void  * resultp, signed int  size);
extern void Cilk_after_sync_slow_cp(CilkWorkerState  *const  ws, Cilk_time  * work, Cilk_time  * cp);
extern void Cilk_abort_standalone(CilkWorkerState  *const  ws);
extern void Cilk_abort_slow(CilkWorkerState  *const  ws);
extern void Cilk_event_new_thread(CilkWorkerState  *const  ws);
extern void Cilk_destroy_frame(CilkWorkerState  *const  ws, CilkStackFrame  * f, size_t  size);
extern signed int Cilk_flags_are_wrong_NODEBUG_NOTIMING_NOSTATS_please_recompile;
static signed int  *Cilk_check_flags_at_link_time = (&(Cilk_flags_are_wrong_NODEBUG_NOTIMING_NOSTATS_please_recompile));
static signed int Cilk_check_flags_at_link_time_hack(void) __attribute__((__unused__));
static signed int Cilk_check_flags_at_link_time_hack(void)
{

  {
    return (*(Cilk_check_flags_at_link_time));
  }
}
void Cilk_start(CilkContext  *const  context, void ( * main)(CilkWorkerState  *const  ws, void  * args), void  * args, signed int  return_size);
void Cilk_free(void  * );
void  *Cilk_malloc_fixed(size_t  );
static const char  *ident_cilk_cilk2c_pre __attribute__((__unused__)) = "$HeadURL: https://bradley.csail.mit.edu/svn/repos/cilk/5.4.3/runtime/cilk-cilk2c-pre.h $ $LastChangedBy: bradley $ $Rev: 1465 $ $Date: 2004-08-02 06:31:06 -0400 (Mon, 02 Aug 2004) $";
static inline void  *Cilk_internal_malloc_fast(CilkWorkerState  *const  ws, size_t  size)
{

  {
    signed int bucket;
    void  *mem;
    struct Cilk_im_descriptor  *d;
    ;
    if (((size) > 4096))
    {
      return ((Cilk_internal_malloc)((ws), (size)));
    } else {
      ;
    }
    ((bucket) = ((Cilk_internal_malloc_size_to_bucket)((size))));
    ((d) = (((ws)->im_descriptor) + (bucket)));
    if ((((mem) = ((d)->free_list))))
    {
      {
        (((d)->free_list) = ((((void * *)(mem)))[0]));
        (((d)->count)++);
      }
    } else {
      {
        ((mem) = ((Cilk_internal_malloc)((ws), (size))));
      }
    }
    return (mem);
  }
}
static inline void Cilk_internal_free_fast(CilkWorkerState  *const  ws, void  * p, size_t  size)
{

  {
    signed int bucket;
    struct Cilk_im_descriptor  *d;
    if (((size) > 4096))
    {
      {
        ((Cilk_internal_free)((ws), (p), (size)));
        return ;
      }
    } else {
      ;
    }
    ((bucket) = ((Cilk_internal_malloc_size_to_bucket)((size))));
    ((d) = (((ws)->im_descriptor) + (bucket)));
    if ((((d)->count) <= 0))
    {
      ((Cilk_internal_free)((ws), (p), (size)));
    } else {
      {
        (((((void * *)(p)))[0]) = ((d)->free_list));
        (((d)->free_list) = (p));
        (((d)->count)--);
        ;
      }
    }
  }
}
static inline void Cilk_destroy_frame_fast(CilkWorkerState  *const  ws, CilkStackFrame  * f, size_t  size)
{

  {
    {
      if (((f)->alloca_h))
      {
        ((Cilk_unalloca_internal)((ws), (f)));
      } else {
        ;
      }
    }
    ;
    ((Cilk_internal_free_fast)((ws), (f), (size)));
  }
}
static inline void  *Cilk_create_frame(CilkWorkerState  *const  ws, size_t  size, CilkProcInfo  * sig)
{

  {
    CilkStackFrame  *f = ((Cilk_internal_malloc_fast)((ws), (size)));
    (((f)->sig) = (sig));
    (((f)->alloca_h) = ((struct cilk_alloca_header *)0));
    ;
    return ((void *)(f));
  }
}
static inline void Cilk_cilk2c_push_frame(CilkWorkerState  *const  ws __attribute__((__unused__)), CilkStackFrame  * frame __attribute__((__unused__)))
{

  {
    ;
    ;
    ;
    ((Cilk_membar_StoreStore)());
  }
}
static inline void  *Cilk_cilk2c_init_frame(CilkWorkerState  *const  ws, size_t  s, CilkProcInfo  * signat)
{

  {
    volatile CilkStackFrame  * *t;
    void  *f;
    ((f) = ((Cilk_create_frame)((ws), (s), (signat))));
    ((t) = (((ws)->cache).tail));
    ;
    ((*(t)) = ((CilkStackFrame *)(f)));
    ((Cilk_membar_StoreStore)());
    ((((ws)->cache).tail) = ((t) + 1));
    return (f);
  }
}
static inline signed int Cilk_cilk2c_pop_check(CilkWorkerState  *const  ws)
{

  {
    volatile CilkStackFrame  * *t;
    ((t) = (((ws)->cache).tail));
    ((Cilk_membar_StoreLoad)());
    return (((((ws)->cache).exception) >= (t)));
  }
}
static inline void Cilk_cilk2c_pop(CilkWorkerState  *const  ws)
{

  {
    (--(((ws)->cache).tail));
  }
}
static inline void Cilk_cilk2c_event_new_thread_maybe(CilkWorkerState  *const  ws __attribute__((__unused__)))
{

  {
    ;
    ;
  }
}
static inline void Cilk_cilk2c_start_thread_slow(CilkWorkerState  *const  ws __attribute__((__unused__)), CilkStackFrame  * frame __attribute__((__unused__)))
{

  {
    ;
    ;
    ;
  }
}
static inline void Cilk_cilk2c_before_return_fast(CilkWorkerState  *const  ws, CilkStackFrame  * frame, size_t  size)
{

  {
    ;
    ;
    ((Cilk_destroy_frame_fast)((ws), ((CilkStackFrame *)(frame)), (size)));
    (--(((ws)->cache).tail));
  }
}
static inline void Cilk_cilk2c_before_return_slow(CilkWorkerState  *const  ws, CilkStackFrame  * frame, size_t  size)
{

  {
    ((Cilk_cilk2c_before_return_fast)((ws), (frame), (size)));
  }
}
static inline void Cilk_cilk2c_start_thread_fast_cp(CilkWorkerState  *const  ws __attribute__((__unused__)), CilkStackFrame  * frame __attribute__((__unused__)))
{

  {
    ;
    ;
  }
}
static inline void Cilk_cilk2c_start_thread_slow_cp(CilkWorkerState  *const  ws __attribute__((__unused__)), CilkStackFrame  * frame __attribute__((__unused__)))
{

  {
    ;
    ;
  }
}
static inline void Cilk_cilk2c_at_thread_boundary_slow_cp(CilkWorkerState  *const  ws __attribute__((__unused__)), CilkStackFrame  * frame __attribute__((__unused__)))
{

  {
    ;
    ;
  }
}
static inline void Cilk_cilk2c_before_spawn_fast_cp(CilkWorkerState  *const  ws __attribute__((__unused__)), CilkStackFrame  * frame __attribute__((__unused__)))
{

  {
    ;
    ;
  }
}
static inline void Cilk_cilk2c_before_spawn_slow_cp(CilkWorkerState  *const  ws __attribute__((__unused__)), CilkStackFrame  * frame __attribute__((__unused__)))
{

  {
    ;
    ;
  }
}
static inline void Cilk_cilk2c_after_spawn_fast_cp(CilkWorkerState  *const  ws __attribute__((__unused__)), CilkStackFrame  * frame __attribute__((__unused__)))
{

  {
    ;
    ;
  }
}
static inline void Cilk_cilk2c_after_spawn_slow_cp(CilkWorkerState  *const  ws __attribute__((__unused__)), CilkStackFrame  * frame __attribute__((__unused__)))
{

  {
    ;
    ;
  }
}
static inline void Cilk_cilk2c_at_sync_fast_cp(CilkWorkerState  *const  ws __attribute__((__unused__)), CilkStackFrame  * frame __attribute__((__unused__)))
{

  {
    ;
    ;
  }
}
static inline void Cilk_cilk2c_before_sync_slow_cp(CilkWorkerState  *const  ws __attribute__((__unused__)), CilkStackFrame  * frame __attribute__((__unused__)))
{

  {
    ;
    ;
  }
}
static inline void Cilk_cilk2c_after_sync_slow_cp(CilkWorkerState  *const  ws __attribute__((__unused__)), CilkStackFrame  * frame __attribute__((__unused__)))
{

  {
    ;
    ;
  }
}
static inline void Cilk_cilk2c_before_return_fast_cp(CilkWorkerState  *const  ws __attribute__((__unused__)), CilkStackFrame  * frame __attribute__((__unused__)))
{

  {
    ;
    ;
  }
}
static inline void Cilk_cilk2c_before_return_slow_cp(CilkWorkerState  *const  ws __attribute__((__unused__)), CilkStackFrame  * frame __attribute__((__unused__)))
{

  {
    ;
    ;
  }
}
typedef struct YN YN;
struct _GenericDatatype {
  unsigned int refId;
  unsigned int tag;
  
};
struct YN {
  unsigned int refId;
  enum _YN_types {
    YN_Yes,
    YN_No,
    YN_Undecided
  } tag;
  union _YN_contents {
    struct YN_Yes_s {
      
    } Yes;
    struct YN_No_s {
      
    } No;
    struct YN_Undecided_s {
      
    } Undecided;
    
  } contents;
  
};
static inline YN  *Yes(void)
{

  YN  *temp;
  ((temp) = ({
    
    ((YN *)((malloc)((sizeof(YN))))); })
  );
  (((temp)->tag) = (YN_Yes));
  (((temp)->refId) = 45);
  ;
  ;
  return (temp);
}
static inline YN  *No(void)
{

  YN  *temp;
  ((temp) = ({
    
    ((YN *)((malloc)((sizeof(YN))))); })
  );
  (((temp)->tag) = (YN_No));
  (((temp)->refId) = 45);
  ;
  ;
  return (temp);
}
static inline YN  *Undecided(void)
{

  YN  *temp;
  ((temp) = ({
    
    ((YN *)((malloc)((sizeof(YN))))); })
  );
  (((temp)->tag) = (YN_Undecided));
  (((temp)->refId) = 45);
  ;
  ;
  return (temp);
}
typedef struct Vote Vote;
struct Vote {
  unsigned int refId;
  enum _Vote_types {
    Vote_Horace,
    Vote_Franz,
    Vote_Kat
  } tag;
  union _Vote_contents {
    struct Vote_Horace_s {
      YN  *f0;
      
    } Horace;
    struct Vote_Franz_s {
      YN  *f0;
      
    } Franz;
    struct Vote_Kat_s {
      YN  *f0;
      
    } Kat;
    
  } contents;
  
};
static inline Vote  *Horace(YN  * f0)
{

  Vote  *temp;
  ((temp) = ({
    
    ((Vote *)((malloc)((sizeof(Vote))))); })
  );
  (((temp)->tag) = (Vote_Horace));
  (((temp)->refId) = 52);
  ;
  (((((temp)->contents).Horace).f0) = (f0));
  ;
  return (temp);
}
static inline Vote  *Franz(YN  * f0)
{

  Vote  *temp;
  ((temp) = ({
    
    ((Vote *)((malloc)((sizeof(Vote))))); })
  );
  (((temp)->tag) = (Vote_Franz));
  (((temp)->refId) = 52);
  ;
  (((((temp)->contents).Franz).f0) = (f0));
  ;
  return (temp);
}
static inline Vote  *Kat(YN  * f0)
{

  Vote  *temp;
  ((temp) = ({
    
    ((Vote *)((malloc)((sizeof(Vote))))); })
  );
  (((temp)->tag) = (Vote_Kat));
  (((temp)->refId) = 52);
  ;
  (((((temp)->contents).Kat).f0) = (f0));
  ;
  return (temp);
}
typedef struct VoteSet VoteSet;
struct VoteSet {
  unsigned int refId;
  enum _VoteSet_types {
    VoteSet_Empty,
    VoteSet_Set,
    VoteSet_Top
  } tag;
  union _VoteSet_contents {
    struct VoteSet_Empty_s {
      
    } Empty;
    struct VoteSet_Set_s {
      Vote  *f0;
      VoteSet  *f1;
      
    } Set;
    struct VoteSet_Top_s {
      
    } Top;
    
  } contents;
  
};
static inline VoteSet  *Empty(void)
{

  VoteSet  *temp;
  ((temp) = ({
    
    ((VoteSet *)((malloc)((sizeof(VoteSet))))); })
  );
  (((temp)->tag) = (VoteSet_Empty));
  (((temp)->refId) = 58);
  ;
  ;
  return (temp);
}
static inline VoteSet  *Set(Vote  * f0, VoteSet  * f1)
{

  VoteSet  *temp;
  ((temp) = ({
    
    ((VoteSet *)((malloc)((sizeof(VoteSet))))); })
  );
  (((temp)->tag) = (VoteSet_Set));
  (((temp)->refId) = 58);
  ;
  (((((temp)->contents).Set).f0) = (f0));
  (((((temp)->contents).Set).f1) = (f1));
  ;
  return (temp);
}
static inline VoteSet  *Top(void)
{

  VoteSet  *temp;
  ((temp) = ({
    
    ((VoteSet *)((malloc)((sizeof(VoteSet))))); })
  );
  (((temp)->tag) = (VoteSet_Top));
  (((temp)->refId) = 58);
  ;
  ;
  return (temp);
}
struct _string_s showYN(YN  * yn)
{

  {
    struct _string_s result;
    {
      /* match ((yn)) ... */;
      YN  *_match_scrutinee_val = (yn);
      YN  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
      /* matching for pattern Yes() */;
      /* ... declarations of pattern variables */;
      ;
      YN  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
      if (({
        signed int _match = 1;
        /* matching against a ADT constructor pattern */;
        /* match against constructor */;
        if (((((*(_curr_scrutinee_ptr)))->tag) != (YN_Yes)))
        {
          ((_match) = 0);
        } else {
          /* match against sub-patterns, setting _match to 0 on a fail */;
          YN  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
          ;
        }
        (_match); })
      )
      {
        ((result) = ((strCharPointer)("Yes()")));
      } else {
        /* matching for pattern No() */;
        /* ... declarations of pattern variables */;
        ;
        YN  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
        if (({
          signed int _match = 1;
          /* matching against a ADT constructor pattern */;
          /* match against constructor */;
          if (((((*(_curr_scrutinee_ptr)))->tag) != (YN_No)))
          {
            ((_match) = 0);
          } else {
            /* match against sub-patterns, setting _match to 0 on a fail */;
            YN  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
            ;
          }
          (_match); })
        )
        {
          ((result) = ((strCharPointer)("No()")));
        } else {
          /* no match, do nothing. */;
        }
      }
    }
    return (result);
  }
}
struct _string_s showVote(Vote  * v)
{

  {
    struct _string_s result;
    {
      /* match ((v)) ... */;
      Vote  *_match_scrutinee_val = (v);
      Vote  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
      /* matching for pattern Horace(yn1) */;
      /* ... declarations of pattern variables */;
      YN  *yn1;
      Vote  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
      if (({
        signed int _match = 1;
        /* matching against a ADT constructor pattern */;
        /* match against constructor */;
        if (((((*(_curr_scrutinee_ptr)))->tag) != (Vote_Horace)))
        {
          ((_match) = 0);
        } else {
          /* match against sub-patterns, setting _match to 0 on a fail */;
          Vote  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
          {
            YN  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Horace).f0));
            ((yn1) = (*(_curr_scrutinee_ptr)));
          }
          ;
        }
        (_match); })
      )
      {
        ((result) = ((_append_string)(((_append_string)(((strCharPointer)("Horace(")), ((showYN)((yn1))))), ((strCharPointer)(")")))));
      } else {
        /* matching for pattern Franz(yn1) */;
        /* ... declarations of pattern variables */;
        YN  *yn1;
        Vote  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
        if (({
          signed int _match = 1;
          /* matching against a ADT constructor pattern */;
          /* match against constructor */;
          if (((((*(_curr_scrutinee_ptr)))->tag) != (Vote_Franz)))
          {
            ((_match) = 0);
          } else {
            /* match against sub-patterns, setting _match to 0 on a fail */;
            Vote  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
            {
              YN  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Franz).f0));
              ((yn1) = (*(_curr_scrutinee_ptr)));
            }
            ;
          }
          (_match); })
        )
        {
          ((result) = ((_append_string)(((_append_string)(((strCharPointer)("Franz(")), ((showYN)((yn1))))), ((strCharPointer)(")")))));
        } else {
          /* matching for pattern Kat(yn1) */;
          /* ... declarations of pattern variables */;
          YN  *yn1;
          Vote  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
          if (({
            signed int _match = 1;
            /* matching against a ADT constructor pattern */;
            /* match against constructor */;
            if (((((*(_curr_scrutinee_ptr)))->tag) != (Vote_Kat)))
            {
              ((_match) = 0);
            } else {
              /* match against sub-patterns, setting _match to 0 on a fail */;
              Vote  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
              {
                YN  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Kat).f0));
                ((yn1) = (*(_curr_scrutinee_ptr)));
              }
              ;
            }
            (_match); })
          )
          {
            ((result) = ((_append_string)(((_append_string)(((strCharPointer)("Kat(")), ((showYN)((yn1))))), ((strCharPointer)(")")))));
          } else {
            /* no match, do nothing. */;
          }
        }
      }
    }
    return (result);
  }
}
struct _string_s showInner(VoteSet  * v)
{

  {
    struct _string_s result = ((strCharPointer)(""));
    {
      /* match ((v)) ... */;
      VoteSet  *_match_scrutinee_val = (v);
      VoteSet  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
      /* matching for pattern Empty() */;
      /* ... declarations of pattern variables */;
      ;
      VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
      if (({
        signed int _match = 1;
        /* matching against a ADT constructor pattern */;
        /* match against constructor */;
        if (((((*(_curr_scrutinee_ptr)))->tag) != (VoteSet_Empty)))
        {
          ((_match) = 0);
        } else {
          /* match against sub-patterns, setting _match to 0 on a fail */;
          VoteSet  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
          ;
        }
        (_match); })
      )
      {
        ;
      } else {
        /* matching for pattern Set(hd,tl) */;
        /* ... declarations of pattern variables */;
        Vote  *hd;
        VoteSet  *tl;
        VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
        if (({
          signed int _match = 1;
          /* matching against a ADT constructor pattern */;
          /* match against constructor */;
          if (((((*(_curr_scrutinee_ptr)))->tag) != (VoteSet_Set)))
          {
            ((_match) = 0);
          } else {
            /* match against sub-patterns, setting _match to 0 on a fail */;
            VoteSet  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
            {
              Vote  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Set).f0));
              ((hd) = (*(_curr_scrutinee_ptr)));
            }
            {
              VoteSet  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Set).f1));
              ((tl) = (*(_curr_scrutinee_ptr)));
            }
            ;
          }
          (_match); })
        )
        {
          ((result) = ((showVote)((hd))));
          {
            /* match ((tl)) ... */;
            VoteSet  *_match_scrutinee_val = (tl);
            VoteSet  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
            /* matching for pattern Empty() */;
            /* ... declarations of pattern variables */;
            ;
            VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
            if (({
              signed int _match = 1;
              /* matching against a ADT constructor pattern */;
              /* match against constructor */;
              if (((((*(_curr_scrutinee_ptr)))->tag) != (VoteSet_Empty)))
              {
                ((_match) = 0);
              } else {
                /* match against sub-patterns, setting _match to 0 on a fail */;
                VoteSet  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
                ;
              }
              (_match); })
            )
            {
              ;
            } else {
              /* matching for pattern other */;
              /* ... declarations of pattern variables */;
              VoteSet  *other;
              VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
              if (({
                signed int _match = 1;
                ((other) = (*(_curr_scrutinee_ptr)));
                (_match); })
              )
              {
                ({
                  struct _string_s  *_tmp67 = (&(result));
                  ((*(_tmp67)) = ((_append_string)((*(_tmp67)), ((_append_string)(((strCharPointer)(", ")), ((showInner)((tl)))))))); })
                ;
              } else {
                /* no match, do nothing. */;
              }
            }
          }
        } else {
          /* matching for pattern Top() */;
          /* ... declarations of pattern variables */;
          ;
          VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
          if (({
            signed int _match = 1;
            /* matching against a ADT constructor pattern */;
            /* match against constructor */;
            if (((((*(_curr_scrutinee_ptr)))->tag) != (VoteSet_Top)))
            {
              ((_match) = 0);
            } else {
              /* match against sub-patterns, setting _match to 0 on a fail */;
              VoteSet  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
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
struct _string_s showVoteSet(VoteSet  * v)
{

  {
    return ((_append_string)(((_append_string)(((strCharPointer)("{")), ((showInner)((v))))), ((strCharPointer)("}"))));
  }
}
signed int eqYN(YN  * yn1, YN  * yn2)
{

  {
    {
      /* match ((yn1)) ... */;
      YN  *_match_scrutinee_val = (yn1);
      YN  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
      /* matching for pattern Yes() */;
      /* ... declarations of pattern variables */;
      ;
      YN  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
      if (({
        signed int _match = 1;
        /* matching against a ADT constructor pattern */;
        /* match against constructor */;
        if (((((*(_curr_scrutinee_ptr)))->tag) != (YN_Yes)))
        {
          ((_match) = 0);
        } else {
          /* match against sub-patterns, setting _match to 0 on a fail */;
          YN  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
          ;
        }
        (_match); })
      )
      {
        {
          /* match ((yn2)) ... */;
          YN  *_match_scrutinee_val = (yn2);
          YN  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
          /* matching for pattern Yes() */;
          /* ... declarations of pattern variables */;
          ;
          YN  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
          if (({
            signed int _match = 1;
            /* matching against a ADT constructor pattern */;
            /* match against constructor */;
            if (((((*(_curr_scrutinee_ptr)))->tag) != (YN_Yes)))
            {
              ((_match) = 0);
            } else {
              /* match against sub-patterns, setting _match to 0 on a fail */;
              YN  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
              ;
            }
            (_match); })
          )
          {
            return 1;
          } else {
            /* matching for pattern other */;
            /* ... declarations of pattern variables */;
            YN  *other;
            YN  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
            if (({
              signed int _match = 1;
              ((other) = (*(_curr_scrutinee_ptr)));
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
        /* matching for pattern No() */;
        /* ... declarations of pattern variables */;
        ;
        YN  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
        if (({
          signed int _match = 1;
          /* matching against a ADT constructor pattern */;
          /* match against constructor */;
          if (((((*(_curr_scrutinee_ptr)))->tag) != (YN_No)))
          {
            ((_match) = 0);
          } else {
            /* match against sub-patterns, setting _match to 0 on a fail */;
            YN  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
            ;
          }
          (_match); })
        )
        {
          {
            /* match ((yn2)) ... */;
            YN  *_match_scrutinee_val = (yn2);
            YN  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
            /* matching for pattern No() */;
            /* ... declarations of pattern variables */;
            ;
            YN  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
            if (({
              signed int _match = 1;
              /* matching against a ADT constructor pattern */;
              /* match against constructor */;
              if (((((*(_curr_scrutinee_ptr)))->tag) != (YN_No)))
              {
                ((_match) = 0);
              } else {
                /* match against sub-patterns, setting _match to 0 on a fail */;
                YN  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
                ;
              }
              (_match); })
            )
            {
              return 1;
            } else {
              /* matching for pattern other */;
              /* ... declarations of pattern variables */;
              YN  *other;
              YN  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
              if (({
                signed int _match = 1;
                ((other) = (*(_curr_scrutinee_ptr)));
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
          /* matching for pattern Undecided() */;
          /* ... declarations of pattern variables */;
          ;
          YN  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
          if (({
            signed int _match = 1;
            /* matching against a ADT constructor pattern */;
            /* match against constructor */;
            if (((((*(_curr_scrutinee_ptr)))->tag) != (YN_Undecided)))
            {
              ((_match) = 0);
            } else {
              /* match against sub-patterns, setting _match to 0 on a fail */;
              YN  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
              ;
            }
            (_match); })
          )
          {
            {
              /* match ((yn2)) ... */;
              YN  *_match_scrutinee_val = (yn2);
              YN  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
              /* matching for pattern Undecided() */;
              /* ... declarations of pattern variables */;
              ;
              YN  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
              if (({
                signed int _match = 1;
                /* matching against a ADT constructor pattern */;
                /* match against constructor */;
                if (((((*(_curr_scrutinee_ptr)))->tag) != (YN_Undecided)))
                {
                  ((_match) = 0);
                } else {
                  /* match against sub-patterns, setting _match to 0 on a fail */;
                  YN  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
                  ;
                }
                (_match); })
              )
              {
                return 1;
              } else {
                /* matching for pattern other */;
                /* ... declarations of pattern variables */;
                YN  *other;
                YN  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
                if (({
                  signed int _match = 1;
                  ((other) = (*(_curr_scrutinee_ptr)));
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
            /* no match, do nothing. */;
          }
        }
      }
    }
  }
}
signed int eqVotes(Vote  * v1, Vote  * v2)
{

  {
    {
      /* match ((v1)) ... */;
      Vote  *_match_scrutinee_val = (v1);
      Vote  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
      /* matching for pattern Horace(yn1) */;
      /* ... declarations of pattern variables */;
      YN  *yn1;
      Vote  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
      if (({
        signed int _match = 1;
        /* matching against a ADT constructor pattern */;
        /* match against constructor */;
        if (((((*(_curr_scrutinee_ptr)))->tag) != (Vote_Horace)))
        {
          ((_match) = 0);
        } else {
          /* match against sub-patterns, setting _match to 0 on a fail */;
          Vote  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
          {
            YN  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Horace).f0));
            ((yn1) = (*(_curr_scrutinee_ptr)));
          }
          ;
        }
        (_match); })
      )
      {
        {
          /* match ((v2)) ... */;
          Vote  *_match_scrutinee_val = (v2);
          Vote  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
          /* matching for pattern Horace(yn2) */;
          /* ... declarations of pattern variables */;
          YN  *yn2;
          Vote  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
          if (({
            signed int _match = 1;
            /* matching against a ADT constructor pattern */;
            /* match against constructor */;
            if (((((*(_curr_scrutinee_ptr)))->tag) != (Vote_Horace)))
            {
              ((_match) = 0);
            } else {
              /* match against sub-patterns, setting _match to 0 on a fail */;
              Vote  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
              {
                YN  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Horace).f0));
                ((yn2) = (*(_curr_scrutinee_ptr)));
              }
              ;
            }
            (_match); })
          )
          {
            return ((eqYN)((yn1), (yn2)));
          } else {
            /* matching for pattern other */;
            /* ... declarations of pattern variables */;
            Vote  *other;
            Vote  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
            if (({
              signed int _match = 1;
              ((other) = (*(_curr_scrutinee_ptr)));
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
        /* matching for pattern Franz(yn1) */;
        /* ... declarations of pattern variables */;
        YN  *yn1;
        Vote  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
        if (({
          signed int _match = 1;
          /* matching against a ADT constructor pattern */;
          /* match against constructor */;
          if (((((*(_curr_scrutinee_ptr)))->tag) != (Vote_Franz)))
          {
            ((_match) = 0);
          } else {
            /* match against sub-patterns, setting _match to 0 on a fail */;
            Vote  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
            {
              YN  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Franz).f0));
              ((yn1) = (*(_curr_scrutinee_ptr)));
            }
            ;
          }
          (_match); })
        )
        {
          {
            /* match ((v2)) ... */;
            Vote  *_match_scrutinee_val = (v2);
            Vote  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
            /* matching for pattern Franz(yn2) */;
            /* ... declarations of pattern variables */;
            YN  *yn2;
            Vote  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
            if (({
              signed int _match = 1;
              /* matching against a ADT constructor pattern */;
              /* match against constructor */;
              if (((((*(_curr_scrutinee_ptr)))->tag) != (Vote_Franz)))
              {
                ((_match) = 0);
              } else {
                /* match against sub-patterns, setting _match to 0 on a fail */;
                Vote  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
                {
                  YN  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Franz).f0));
                  ((yn2) = (*(_curr_scrutinee_ptr)));
                }
                ;
              }
              (_match); })
            )
            {
              return ((eqYN)((yn1), (yn2)));
            } else {
              /* matching for pattern other */;
              /* ... declarations of pattern variables */;
              Vote  *other;
              Vote  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
              if (({
                signed int _match = 1;
                ((other) = (*(_curr_scrutinee_ptr)));
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
          /* matching for pattern Kat(yn1) */;
          /* ... declarations of pattern variables */;
          YN  *yn1;
          Vote  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
          if (({
            signed int _match = 1;
            /* matching against a ADT constructor pattern */;
            /* match against constructor */;
            if (((((*(_curr_scrutinee_ptr)))->tag) != (Vote_Kat)))
            {
              ((_match) = 0);
            } else {
              /* match against sub-patterns, setting _match to 0 on a fail */;
              Vote  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
              {
                YN  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Kat).f0));
                ((yn1) = (*(_curr_scrutinee_ptr)));
              }
              ;
            }
            (_match); })
          )
          {
            {
              /* match ((v2)) ... */;
              Vote  *_match_scrutinee_val = (v2);
              Vote  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
              /* matching for pattern Kat(yn2) */;
              /* ... declarations of pattern variables */;
              YN  *yn2;
              Vote  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
              if (({
                signed int _match = 1;
                /* matching against a ADT constructor pattern */;
                /* match against constructor */;
                if (((((*(_curr_scrutinee_ptr)))->tag) != (Vote_Kat)))
                {
                  ((_match) = 0);
                } else {
                  /* match against sub-patterns, setting _match to 0 on a fail */;
                  Vote  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
                  {
                    YN  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Kat).f0));
                    ((yn2) = (*(_curr_scrutinee_ptr)));
                  }
                  ;
                }
                (_match); })
              )
              {
                return ((eqYN)((yn1), (yn2)));
              } else {
                /* matching for pattern other */;
                /* ... declarations of pattern variables */;
                Vote  *other;
                Vote  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
                if (({
                  signed int _match = 1;
                  ((other) = (*(_curr_scrutinee_ptr)));
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
            /* no match, do nothing. */;
          }
        }
      }
    }
  }
}
VoteSet  *removeFromSet(Vote  * v, VoteSet  * vs)
{

  {
    {
      /* match ((vs)) ... */;
      VoteSet  *_match_scrutinee_val = (vs);
      VoteSet  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
      /* matching for pattern Empty() */;
      /* ... declarations of pattern variables */;
      ;
      VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
      if (({
        signed int _match = 1;
        /* matching against a ADT constructor pattern */;
        /* match against constructor */;
        if (((((*(_curr_scrutinee_ptr)))->tag) != (VoteSet_Empty)))
        {
          ((_match) = 0);
        } else {
          /* match against sub-patterns, setting _match to 0 on a fail */;
          VoteSet  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
          ;
        }
        (_match); })
      )
      {
        return ((Empty)());
      } else {
        /* matching for pattern Set(hd,rest) */;
        /* ... declarations of pattern variables */;
        Vote  *hd;
        VoteSet  *rest;
        VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
        if (({
          signed int _match = 1;
          /* matching against a ADT constructor pattern */;
          /* match against constructor */;
          if (((((*(_curr_scrutinee_ptr)))->tag) != (VoteSet_Set)))
          {
            ((_match) = 0);
          } else {
            /* match against sub-patterns, setting _match to 0 on a fail */;
            VoteSet  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
            {
              Vote  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Set).f0));
              ((hd) = (*(_curr_scrutinee_ptr)));
            }
            {
              VoteSet  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Set).f1));
              ((rest) = (*(_curr_scrutinee_ptr)));
            }
            ;
          }
          (_match); })
        )
        {
          if (((eqVotes)((hd), (v))))
          {
            {
              return (rest);
            }
          } else {
            ;
          }
          return ((Set)((hd), ((removeFromSet)((v), (rest)))));
        } else {
          /* matching for pattern Top() */;
          /* ... declarations of pattern variables */;
          ;
          VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
          if (({
            signed int _match = 1;
            /* matching against a ADT constructor pattern */;
            /* match against constructor */;
            if (((((*(_curr_scrutinee_ptr)))->tag) != (VoteSet_Top)))
            {
              ((_match) = 0);
            } else {
              /* match against sub-patterns, setting _match to 0 on a fail */;
              VoteSet  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
              ;
            }
            (_match); })
          )
          {
            return ((Top)());
          } else {
            /* no match, do nothing. */;
          }
        }
      }
    }
  }
}
signed int eq(VoteSet  * v1, VoteSet  * v2)
{

  {
    {
      /* match ((v1)) ... */;
      VoteSet  *_match_scrutinee_val = (v1);
      VoteSet  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
      /* matching for pattern Empty() */;
      /* ... declarations of pattern variables */;
      ;
      VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
      if (({
        signed int _match = 1;
        /* matching against a ADT constructor pattern */;
        /* match against constructor */;
        if (((((*(_curr_scrutinee_ptr)))->tag) != (VoteSet_Empty)))
        {
          ((_match) = 0);
        } else {
          /* match against sub-patterns, setting _match to 0 on a fail */;
          VoteSet  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
          ;
        }
        (_match); })
      )
      {
        {
          /* match ((v2)) ... */;
          VoteSet  *_match_scrutinee_val = (v2);
          VoteSet  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
          /* matching for pattern Empty() */;
          /* ... declarations of pattern variables */;
          ;
          VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
          if (({
            signed int _match = 1;
            /* matching against a ADT constructor pattern */;
            /* match against constructor */;
            if (((((*(_curr_scrutinee_ptr)))->tag) != (VoteSet_Empty)))
            {
              ((_match) = 0);
            } else {
              /* match against sub-patterns, setting _match to 0 on a fail */;
              VoteSet  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
              ;
            }
            (_match); })
          )
          {
            return 1;
          } else {
            /* matching for pattern other */;
            /* ... declarations of pattern variables */;
            VoteSet  *other;
            VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
            if (({
              signed int _match = 1;
              ((other) = (*(_curr_scrutinee_ptr)));
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
        /* matching for pattern Set(head1,rest1) */;
        /* ... declarations of pattern variables */;
        Vote  *head1;
        VoteSet  *rest1;
        VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
        if (({
          signed int _match = 1;
          /* matching against a ADT constructor pattern */;
          /* match against constructor */;
          if (((((*(_curr_scrutinee_ptr)))->tag) != (VoteSet_Set)))
          {
            ((_match) = 0);
          } else {
            /* match against sub-patterns, setting _match to 0 on a fail */;
            VoteSet  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
            {
              Vote  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Set).f0));
              ((head1) = (*(_curr_scrutinee_ptr)));
            }
            {
              VoteSet  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Set).f1));
              ((rest1) = (*(_curr_scrutinee_ptr)));
            }
            ;
          }
          (_match); })
        )
        {
          {
            /* match ((v2)) ... */;
            VoteSet  *_match_scrutinee_val = (v2);
            VoteSet  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
            /* matching for pattern Empty() */;
            /* ... declarations of pattern variables */;
            ;
            VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
            if (({
              signed int _match = 1;
              /* matching against a ADT constructor pattern */;
              /* match against constructor */;
              if (((((*(_curr_scrutinee_ptr)))->tag) != (VoteSet_Empty)))
              {
                ((_match) = 0);
              } else {
                /* match against sub-patterns, setting _match to 0 on a fail */;
                VoteSet  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
                ;
              }
              (_match); })
            )
            {
              return 0;
            } else {
              /* matching for pattern Set(head2,rest2) */;
              /* ... declarations of pattern variables */;
              Vote  *head2;
              VoteSet  *rest2;
              VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
              if (({
                signed int _match = 1;
                /* matching against a ADT constructor pattern */;
                /* match against constructor */;
                if (((((*(_curr_scrutinee_ptr)))->tag) != (VoteSet_Set)))
                {
                  ((_match) = 0);
                } else {
                  /* match against sub-patterns, setting _match to 0 on a fail */;
                  VoteSet  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
                  {
                    Vote  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Set).f0));
                    ((head2) = (*(_curr_scrutinee_ptr)));
                  }
                  {
                    VoteSet  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Set).f1));
                    ((rest2) = (*(_curr_scrutinee_ptr)));
                  }
                  ;
                }
                (_match); })
              )
              {
                return ((eq)((rest1), ((removeFromSet)((head1), (v2)))));
              } else {
                /* matching for pattern Top() */;
                /* ... declarations of pattern variables */;
                ;
                VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
                if (({
                  signed int _match = 1;
                  /* matching against a ADT constructor pattern */;
                  /* match against constructor */;
                  if (((((*(_curr_scrutinee_ptr)))->tag) != (VoteSet_Top)))
                  {
                    ((_match) = 0);
                  } else {
                    /* match against sub-patterns, setting _match to 0 on a fail */;
                    VoteSet  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
                    ;
                  }
                  (_match); })
                )
                {
                  return 0;
                } else {
                  /* no match, do nothing. */;
                }
              }
            }
          }
        } else {
          /* matching for pattern Top() */;
          /* ... declarations of pattern variables */;
          ;
          VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
          if (({
            signed int _match = 1;
            /* matching against a ADT constructor pattern */;
            /* match against constructor */;
            if (((((*(_curr_scrutinee_ptr)))->tag) != (VoteSet_Top)))
            {
              ((_match) = 0);
            } else {
              /* match against sub-patterns, setting _match to 0 on a fail */;
              VoteSet  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
              ;
            }
            (_match); })
          )
          {
            {
              /* match ((v2)) ... */;
              VoteSet  *_match_scrutinee_val = (v2);
              VoteSet  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
              /* matching for pattern Top() */;
              /* ... declarations of pattern variables */;
              ;
              VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
              if (({
                signed int _match = 1;
                /* matching against a ADT constructor pattern */;
                /* match against constructor */;
                if (((((*(_curr_scrutinee_ptr)))->tag) != (VoteSet_Top)))
                {
                  ((_match) = 0);
                } else {
                  /* match against sub-patterns, setting _match to 0 on a fail */;
                  VoteSet  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
                  ;
                }
                (_match); })
              )
              {
                return 1;
              } else {
                /* matching for pattern other */;
                /* ... declarations of pattern variables */;
                VoteSet  *other;
                VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
                if (({
                  signed int _match = 1;
                  ((other) = (*(_curr_scrutinee_ptr)));
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
            /* no match, do nothing. */;
          }
        }
      }
    }
  }
}
YN  *getVote(VoteSet  * v, Vote  * vt)
{

  {
    {
      /* match ((v)) ... */;
      VoteSet  *_match_scrutinee_val = (v);
      VoteSet  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
      /* matching for pattern Empty() */;
      /* ... declarations of pattern variables */;
      ;
      VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
      if (({
        signed int _match = 1;
        /* matching against a ADT constructor pattern */;
        /* match against constructor */;
        if (((((*(_curr_scrutinee_ptr)))->tag) != (VoteSet_Empty)))
        {
          ((_match) = 0);
        } else {
          /* match against sub-patterns, setting _match to 0 on a fail */;
          VoteSet  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
          ;
        }
        (_match); })
      )
      {
        return ((Undecided)());
      } else {
        /* matching for pattern Set(Horace(yn1),tail) */;
        /* ... declarations of pattern variables */;
        YN  *yn1;
        VoteSet  *tail;
        VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
        if (({
          signed int _match = 1;
          /* matching against a ADT constructor pattern */;
          /* match against constructor */;
          if (((((*(_curr_scrutinee_ptr)))->tag) != (VoteSet_Set)))
          {
            ((_match) = 0);
          } else {
            /* match against sub-patterns, setting _match to 0 on a fail */;
            VoteSet  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
            {
              Vote  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Set).f0));
              /* matching against a ADT constructor pattern */;
              /* match against constructor */;
              if (((((*(_curr_scrutinee_ptr)))->tag) != (Vote_Horace)))
              {
                ((_match) = 0);
              } else {
                /* match against sub-patterns, setting _match to 0 on a fail */;
                Vote  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
                {
                  YN  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Horace).f0));
                  ((yn1) = (*(_curr_scrutinee_ptr)));
                }
                ;
              }
            }
            {
              VoteSet  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Set).f1));
              ((tail) = (*(_curr_scrutinee_ptr)));
            }
            ;
          }
          (_match); })
        )
        {
          {
            /* match ((vt)) ... */;
            Vote  *_match_scrutinee_val = (vt);
            Vote  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
            /* matching for pattern Horace(yn2) */;
            /* ... declarations of pattern variables */;
            YN  *yn2;
            Vote  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
            if (({
              signed int _match = 1;
              /* matching against a ADT constructor pattern */;
              /* match against constructor */;
              if (((((*(_curr_scrutinee_ptr)))->tag) != (Vote_Horace)))
              {
                ((_match) = 0);
              } else {
                /* match against sub-patterns, setting _match to 0 on a fail */;
                Vote  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
                {
                  YN  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Horace).f0));
                  ((yn2) = (*(_curr_scrutinee_ptr)));
                }
                ;
              }
              (_match); })
            )
            {
              if (((((eqYN)((yn1), (yn2))) || ((eqYN)((yn1), ((Undecided)())))) || ((eqYN)((yn2), ((Undecided)())))))
              {
                {
                  return (yn1);
                }
              } else {
                ;
              }
              return (((void *)0));
            } else {
              /* matching for pattern other */;
              /* ... declarations of pattern variables */;
              Vote  *other;
              Vote  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
              if (({
                signed int _match = 1;
                ((other) = (*(_curr_scrutinee_ptr)));
                (_match); })
              )
              {
                return ((getVote)((tail), (vt)));
              } else {
                /* no match, do nothing. */;
              }
            }
          }
        } else {
          /* matching for pattern Set(Kat(yn1),tail) */;
          /* ... declarations of pattern variables */;
          YN  *yn1;
          VoteSet  *tail;
          VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
          if (({
            signed int _match = 1;
            /* matching against a ADT constructor pattern */;
            /* match against constructor */;
            if (((((*(_curr_scrutinee_ptr)))->tag) != (VoteSet_Set)))
            {
              ((_match) = 0);
            } else {
              /* match against sub-patterns, setting _match to 0 on a fail */;
              VoteSet  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
              {
                Vote  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Set).f0));
                /* matching against a ADT constructor pattern */;
                /* match against constructor */;
                if (((((*(_curr_scrutinee_ptr)))->tag) != (Vote_Kat)))
                {
                  ((_match) = 0);
                } else {
                  /* match against sub-patterns, setting _match to 0 on a fail */;
                  Vote  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
                  {
                    YN  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Kat).f0));
                    ((yn1) = (*(_curr_scrutinee_ptr)));
                  }
                  ;
                }
              }
              {
                VoteSet  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Set).f1));
                ((tail) = (*(_curr_scrutinee_ptr)));
              }
              ;
            }
            (_match); })
          )
          {
            {
              /* match ((vt)) ... */;
              Vote  *_match_scrutinee_val = (vt);
              Vote  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
              /* matching for pattern Kat(yn2) */;
              /* ... declarations of pattern variables */;
              YN  *yn2;
              Vote  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
              if (({
                signed int _match = 1;
                /* matching against a ADT constructor pattern */;
                /* match against constructor */;
                if (((((*(_curr_scrutinee_ptr)))->tag) != (Vote_Kat)))
                {
                  ((_match) = 0);
                } else {
                  /* match against sub-patterns, setting _match to 0 on a fail */;
                  Vote  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
                  {
                    YN  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Kat).f0));
                    ((yn2) = (*(_curr_scrutinee_ptr)));
                  }
                  ;
                }
                (_match); })
              )
              {
                if (((((eqYN)((yn1), (yn2))) || ((eqYN)((yn1), ((Undecided)())))) || ((eqYN)((yn2), ((Undecided)())))))
                {
                  {
                    return (yn1);
                  }
                } else {
                  ;
                }
                return (((void *)0));
              } else {
                /* matching for pattern other */;
                /* ... declarations of pattern variables */;
                Vote  *other;
                Vote  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
                if (({
                  signed int _match = 1;
                  ((other) = (*(_curr_scrutinee_ptr)));
                  (_match); })
                )
                {
                  return ((getVote)((tail), (vt)));
                } else {
                  /* no match, do nothing. */;
                }
              }
            }
          } else {
            /* matching for pattern Set(Franz(yn1),tail) */;
            /* ... declarations of pattern variables */;
            YN  *yn1;
            VoteSet  *tail;
            VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
            if (({
              signed int _match = 1;
              /* matching against a ADT constructor pattern */;
              /* match against constructor */;
              if (((((*(_curr_scrutinee_ptr)))->tag) != (VoteSet_Set)))
              {
                ((_match) = 0);
              } else {
                /* match against sub-patterns, setting _match to 0 on a fail */;
                VoteSet  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
                {
                  Vote  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Set).f0));
                  /* matching against a ADT constructor pattern */;
                  /* match against constructor */;
                  if (((((*(_curr_scrutinee_ptr)))->tag) != (Vote_Franz)))
                  {
                    ((_match) = 0);
                  } else {
                    /* match against sub-patterns, setting _match to 0 on a fail */;
                    Vote  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
                    {
                      YN  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Franz).f0));
                      ((yn1) = (*(_curr_scrutinee_ptr)));
                    }
                    ;
                  }
                }
                {
                  VoteSet  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Set).f1));
                  ((tail) = (*(_curr_scrutinee_ptr)));
                }
                ;
              }
              (_match); })
            )
            {
              {
                /* match ((vt)) ... */;
                Vote  *_match_scrutinee_val = (vt);
                Vote  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
                /* matching for pattern Franz(yn2) */;
                /* ... declarations of pattern variables */;
                YN  *yn2;
                Vote  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
                if (({
                  signed int _match = 1;
                  /* matching against a ADT constructor pattern */;
                  /* match against constructor */;
                  if (((((*(_curr_scrutinee_ptr)))->tag) != (Vote_Franz)))
                  {
                    ((_match) = 0);
                  } else {
                    /* match against sub-patterns, setting _match to 0 on a fail */;
                    Vote  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
                    {
                      YN  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Franz).f0));
                      ((yn2) = (*(_curr_scrutinee_ptr)));
                    }
                    ;
                  }
                  (_match); })
                )
                {
                  if (((((eqYN)((yn1), (yn2))) || ((eqYN)((yn1), ((Undecided)())))) || ((eqYN)((yn2), ((Undecided)())))))
                  {
                    {
                      return (yn1);
                    }
                  } else {
                    ;
                  }
                  return (((void *)0));
                } else {
                  /* matching for pattern other */;
                  /* ... declarations of pattern variables */;
                  Vote  *other;
                  Vote  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
                  if (({
                    signed int _match = 1;
                    ((other) = (*(_curr_scrutinee_ptr)));
                    (_match); })
                  )
                  {
                    return ((getVote)((tail), (vt)));
                  } else {
                    /* no match, do nothing. */;
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
}
signed int isInSet(Vote  * v, VoteSet  * votes)
{

  {
    {
      /* match ((votes)) ... */;
      VoteSet  *_match_scrutinee_val = (votes);
      VoteSet  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
      /* matching for pattern Empty() */;
      /* ... declarations of pattern variables */;
      ;
      VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
      if (({
        signed int _match = 1;
        /* matching against a ADT constructor pattern */;
        /* match against constructor */;
        if (((((*(_curr_scrutinee_ptr)))->tag) != (VoteSet_Empty)))
        {
          ((_match) = 0);
        } else {
          /* match against sub-patterns, setting _match to 0 on a fail */;
          VoteSet  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
          ;
        }
        (_match); })
      )
      {
        return 0;
      } else {
        /* matching for pattern Top() */;
        /* ... declarations of pattern variables */;
        ;
        VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
        if (({
          signed int _match = 1;
          /* matching against a ADT constructor pattern */;
          /* match against constructor */;
          if (((((*(_curr_scrutinee_ptr)))->tag) != (VoteSet_Top)))
          {
            ((_match) = 0);
          } else {
            /* match against sub-patterns, setting _match to 0 on a fail */;
            VoteSet  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
            ;
          }
          (_match); })
        )
        {
          return 0;
        } else {
          /* matching for pattern Set(hd,tail) */;
          /* ... declarations of pattern variables */;
          Vote  *hd;
          VoteSet  *tail;
          VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
          if (({
            signed int _match = 1;
            /* matching against a ADT constructor pattern */;
            /* match against constructor */;
            if (((((*(_curr_scrutinee_ptr)))->tag) != (VoteSet_Set)))
            {
              ((_match) = 0);
            } else {
              /* match against sub-patterns, setting _match to 0 on a fail */;
              VoteSet  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
              {
                Vote  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Set).f0));
                ((hd) = (*(_curr_scrutinee_ptr)));
              }
              {
                VoteSet  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Set).f1));
                ((tail) = (*(_curr_scrutinee_ptr)));
              }
              ;
            }
            (_match); })
          )
          {
            if (((eqVotes)((v), (hd))))
            {
              {
                return 1;
              }
            } else {
              ;
            }
            return ((isInSet)((v), (tail)));
          } else {
            /* no match, do nothing. */;
          }
        }
      }
    }
  }
}
YN  *getVoteType(Vote  * v)
{

  {
    {
      /* match ((v)) ... */;
      Vote  *_match_scrutinee_val = (v);
      Vote  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
      /* matching for pattern Horace(vote) */;
      /* ... declarations of pattern variables */;
      YN  *vote;
      Vote  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
      if (({
        signed int _match = 1;
        /* matching against a ADT constructor pattern */;
        /* match against constructor */;
        if (((((*(_curr_scrutinee_ptr)))->tag) != (Vote_Horace)))
        {
          ((_match) = 0);
        } else {
          /* match against sub-patterns, setting _match to 0 on a fail */;
          Vote  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
          {
            YN  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Horace).f0));
            ((vote) = (*(_curr_scrutinee_ptr)));
          }
          ;
        }
        (_match); })
      )
      {
        return (vote);
      } else {
        /* matching for pattern Franz(vote) */;
        /* ... declarations of pattern variables */;
        YN  *vote;
        Vote  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
        if (({
          signed int _match = 1;
          /* matching against a ADT constructor pattern */;
          /* match against constructor */;
          if (((((*(_curr_scrutinee_ptr)))->tag) != (Vote_Franz)))
          {
            ((_match) = 0);
          } else {
            /* match against sub-patterns, setting _match to 0 on a fail */;
            Vote  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
            {
              YN  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Franz).f0));
              ((vote) = (*(_curr_scrutinee_ptr)));
            }
            ;
          }
          (_match); })
        )
        {
          return (vote);
        } else {
          /* matching for pattern Kat(vote) */;
          /* ... declarations of pattern variables */;
          YN  *vote;
          Vote  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
          if (({
            signed int _match = 1;
            /* matching against a ADT constructor pattern */;
            /* match against constructor */;
            if (((((*(_curr_scrutinee_ptr)))->tag) != (Vote_Kat)))
            {
              ((_match) = 0);
            } else {
              /* match against sub-patterns, setting _match to 0 on a fail */;
              Vote  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
              {
                YN  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Kat).f0));
                ((vote) = (*(_curr_scrutinee_ptr)));
              }
              ;
            }
            (_match); })
          )
          {
            return (vote);
          } else {
            /* no match, do nothing. */;
          }
        }
      }
    }
  }
}
signed int leq(VoteSet  * v1, VoteSet  * v2)
{

  {
    {
      /* match ((v1)) ... */;
      VoteSet  *_match_scrutinee_val = (v1);
      VoteSet  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
      /* matching for pattern Empty() */;
      /* ... declarations of pattern variables */;
      ;
      VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
      if (({
        signed int _match = 1;
        /* matching against a ADT constructor pattern */;
        /* match against constructor */;
        if (((((*(_curr_scrutinee_ptr)))->tag) != (VoteSet_Empty)))
        {
          ((_match) = 0);
        } else {
          /* match against sub-patterns, setting _match to 0 on a fail */;
          VoteSet  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
          ;
        }
        (_match); })
      )
      {
        return 1;
      } else {
        /* matching for pattern Top() */;
        /* ... declarations of pattern variables */;
        ;
        VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
        if (({
          signed int _match = 1;
          /* matching against a ADT constructor pattern */;
          /* match against constructor */;
          if (((((*(_curr_scrutinee_ptr)))->tag) != (VoteSet_Top)))
          {
            ((_match) = 0);
          } else {
            /* match against sub-patterns, setting _match to 0 on a fail */;
            VoteSet  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
            ;
          }
          (_match); })
        )
        {
          return 0;
        } else {
          /* matching for pattern Set(hd,tail) */;
          /* ... declarations of pattern variables */;
          Vote  *hd;
          VoteSet  *tail;
          VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
          if (({
            signed int _match = 1;
            /* matching against a ADT constructor pattern */;
            /* match against constructor */;
            if (((((*(_curr_scrutinee_ptr)))->tag) != (VoteSet_Set)))
            {
              ((_match) = 0);
            } else {
              /* match against sub-patterns, setting _match to 0 on a fail */;
              VoteSet  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
              {
                Vote  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Set).f0));
                ((hd) = (*(_curr_scrutinee_ptr)));
              }
              {
                VoteSet  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Set).f1));
                ((tail) = (*(_curr_scrutinee_ptr)));
              }
              ;
            }
            (_match); })
          )
          {
            if (((((isInSet)((hd), (v2))) == 1) || ((eqYN)(((getVoteType)((hd))), ((Undecided)())))))
            {
              {
                return ((leq)((tail), (v2)));
              }
            } else {
              ;
            }
            return 0;
          } else {
            /* no match, do nothing. */;
          }
        }
      }
    }
  }
}
VoteSet  *lub(VoteSet  * v1, VoteSet  * v2)
{

  {
    {
      /* match ((v1)) ... */;
      VoteSet  *_match_scrutinee_val = (v1);
      VoteSet  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
      /* matching for pattern Empty() */;
      /* ... declarations of pattern variables */;
      ;
      VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
      if (({
        signed int _match = 1;
        /* matching against a ADT constructor pattern */;
        /* match against constructor */;
        if (((((*(_curr_scrutinee_ptr)))->tag) != (VoteSet_Empty)))
        {
          ((_match) = 0);
        } else {
          /* match against sub-patterns, setting _match to 0 on a fail */;
          VoteSet  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
          ;
        }
        (_match); })
      )
      {
        return (v2);
      } else {
        /* matching for pattern Set(hd1,rest1) */;
        /* ... declarations of pattern variables */;
        Vote  *hd1;
        VoteSet  *rest1;
        VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
        if (({
          signed int _match = 1;
          /* matching against a ADT constructor pattern */;
          /* match against constructor */;
          if (((((*(_curr_scrutinee_ptr)))->tag) != (VoteSet_Set)))
          {
            ((_match) = 0);
          } else {
            /* match against sub-patterns, setting _match to 0 on a fail */;
            VoteSet  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
            {
              Vote  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Set).f0));
              ((hd1) = (*(_curr_scrutinee_ptr)));
            }
            {
              VoteSet  * *_curr_scrutinee_ptr = (&(((((*(_cons_scrutinee_ptr)))->contents).Set).f1));
              ((rest1) = (*(_curr_scrutinee_ptr)));
            }
            ;
          }
          (_match); })
        )
        {
          if ((((getVote)((v2), (hd1))) == (((void *)0))))
          {
            {
              return ((Top)());
            }
          } else {
            ;
          }
          {
            /* match ((lub((rest1), (v2)))) ... */;
            VoteSet  *_match_scrutinee_val = ((lub)((rest1), (v2)));
            VoteSet  * *_match_scrutinee_ptr = (&(_match_scrutinee_val));
            /* matching for pattern Top() */;
            /* ... declarations of pattern variables */;
            ;
            VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
            if (({
              signed int _match = 1;
              /* matching against a ADT constructor pattern */;
              /* match against constructor */;
              if (((((*(_curr_scrutinee_ptr)))->tag) != (VoteSet_Top)))
              {
                ((_match) = 0);
              } else {
                /* match against sub-patterns, setting _match to 0 on a fail */;
                VoteSet  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
                ;
              }
              (_match); })
            )
            {
              return ((Top)());
            } else {
              /* matching for pattern other */;
              /* ... declarations of pattern variables */;
              VoteSet  *other;
              VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
              if (({
                signed int _match = 1;
                ((other) = (*(_curr_scrutinee_ptr)));
                (_match); })
              )
              {
                return ((Set)((hd1), ((lub)((rest1), (v2)))));
              } else {
                /* no match, do nothing. */;
              }
            }
          }
        } else {
          /* matching for pattern Top() */;
          /* ... declarations of pattern variables */;
          ;
          VoteSet  * *_curr_scrutinee_ptr = (_match_scrutinee_ptr);
          if (({
            signed int _match = 1;
            /* matching against a ADT constructor pattern */;
            /* match against constructor */;
            if (((((*(_curr_scrutinee_ptr)))->tag) != (VoteSet_Top)))
            {
              ((_match) = 0);
            } else {
              /* match against sub-patterns, setting _match to 0 on a fail */;
              VoteSet  * *_cons_scrutinee_ptr = (_curr_scrutinee_ptr);
              ;
            }
            (_match); })
          )
          {
            return ((Top)());
          } else {
            /* no match, do nothing. */;
          }
        }
      }
    }
  }
}
signed int  *randArr(signed int  size)
{

  {
    signed int  *arr = ((malloc)(((size) * (sizeof(signed int)))));
    for (signed int i = 0; ((i) < (size)); ((i)++))
    {
      {
        (((arr)[(i)]) = ((rand)()));
      }
    }
    return (arr);
  }
}
void printArr(signed int  * arr, signed int  length)
{

  {
    ((printf)("["));
    if (((length) == 0))
    {
      {
        ((printf)("]\n"));
        return ;
      }
    } else {
      ;
    }
    for (signed int i = 0; ((i) < ((length) - 1)); ((i)++))
    {
      {
        ((printf)("%d ", ((arr)[(i)])));
      }
    }
    ((printf)("%d]\n", ((arr)[((length) - 1)])));
  }
}
signed int minIndex(signed int  * arr, signed int  length)
{

  {
    signed int min_i = 0;
    for (signed int i = 0; ((i) < (length)); ((i)++))
    {
      {
        if ((((arr)[(i)]) < ((arr)[(min_i)])))
        {
          {
            ((min_i) = (i));
          }
        } else {
          ;
        }
      }
    }
    return (min_i);
  }
}
signed int  *copyArr(signed int  * arr, signed int  start, signed int  end)
{

  {
    signed int  *newArr = ((malloc)(((((end) - (start))) * (sizeof(signed int)))));
    for (signed int i = (start); ((i) < (end)); ((i)++))
    {
      {
        (((newArr)[((i) - (start))]) = ((arr)[(i)]));
      }
    }
    return (newArr);
  }
}
signed int  *concatArr(signed int  * arr1, signed int  length1, signed int  * arr2, signed int  length2)
{

  {
    signed int  *newArr = ((malloc)(((((length1) + (length2))) * (sizeof(signed int)))));
    signed int i = 0;
    for(; ((i) < (length1)); ((i)++))
    {
      {
        (((newArr)[(i)]) = ((arr1)[(i)]));
      }
    }
    for(; ((i) < ((length1) + (length2))); ((i)++))
    {
      {
        (((newArr)[(i)]) = ((arr2)[((i) - (length1))]));
      }
    }
    return (newArr);
  }
}
signed int  *selection_sort(signed int  * arr, signed int  length);
signed int  *selection_sort(signed int  * arr, signed int  length)
{

  {
    if (((length) < 2))
    {
      {
        return ((copyArr)((arr), 0, (length)));
      }
    } else {
      ;
    }
    signed int i = ((minIndex)((arr), (length)));
    signed int  *partial;
    signed int  *section1 = ((copyArr)((arr), 0, (i)));
    signed int  *section2 = ((copyArr)((arr), ((i) + 1), (length)));
    signed int  *total = ((concatArr)((section1), (i), (section2), (((length) - (i)) - 1)));
    ((partial) = ((selection_sort)((total), ((length) - 1))));
    signed int  *newOne = ((malloc)((sizeof(signed int))));
    (((newOne)[0]) = ((arr)[(i)]));
    signed int  *result = ((concatArr)((newOne), 1, (partial), ((length) - 1)));
    ((free)((section1)));
    ((free)((section2)));
    ((free)((partial)));
    ((free)((total)));
    ((free)((newOne)));
    return (result);
  }
}
struct _cilk_c_selection_sort_frame;
struct _cilk_c_selection_sort_args;
signed int  *c_selection_sort(CilkWorkerState  *const  _cilk_ws, signed int  * arr, signed int  length);
static void _cilk_c_selection_sort_import(CilkWorkerState *const _cilk_ws, void *_cilk_procargs_v);
struct _cilk_c_selection_sort_frame {
  CilkStackFrame header;
  struct  {
    signed int length;
    signed int  *arr;
    
  } scope360;
  struct  {
    signed int i;
    
  } scope364;
  struct  {
    signed int  *partial;
    
  } scope366;
  struct  {
    signed int  *section1;
    
  } scope367;
  struct  {
    signed int  *section2;
    
  } scope368;
  struct  {
    signed int  *total;
    
  } scope369;
  struct  {
    signed int  *newOne;
    
  } scope373;
  struct  {
    signed int  *result;
    
  } scope375;
  
};
struct _cilk_c_selection_sort_args {
  signed int  *_cilk_proc_result;
  signed int  *arr;
  signed int length;
  
};

#undef CILK_WHERE_AM_I
#define CILK_WHERE_AM_I IN_SLOW_PROCEDURE

static void _cilk_c_selection_sort_slow(CilkWorkerState  *const  _cilk_ws, struct _cilk_c_selection_sort_frame  * _cilk_frame)
{

  
  signed int  *arr;
  signed int length;
  ;
  /* expand CILK2C_START_THREAD_SLOW() macro */;
  ((Cilk_cilk2c_start_thread_slow_cp)((_cilk_ws), (&((_cilk_frame)->header))));
  ((Cilk_cilk2c_start_thread_slow)((_cilk_ws), (&((_cilk_frame)->header))));
  switch (_cilk_frame->header.entry) {case 3: goto _cilk_sync3; case 2: goto _cilk_sync2; case 1: goto _cilk_sync1; }
  /* TODO: restore only live variables */;
  ;
  ;
  {
    if (((length) < 2))
    {
      {
        {
          signed int  *__tmp78 = ((copyArr)((arr), 0, (length)));
          ((Cilk_set_result)((_cilk_ws), (&(__tmp78)), (sizeof((__tmp78)))));
          /* expand CILK2C_BEFORE_RETURN_SLOW macro */;
          ((Cilk_cilk2c_before_return_slow_cp)((_cilk_ws), (&((_cilk_frame)->header))));
          ((Cilk_cilk2c_before_return_slow)((_cilk_ws), (&((_cilk_frame)->header)), (sizeof((*(_cilk_frame))))));
          return ;
        }
      }
    } else {
      ;
    }
    signed int i = ((minIndex)((arr), (length)));
    signed int  *partial;
    signed int  *section1 = ((copyArr)((arr), 0, (i)));
    signed int  *section2 = ((copyArr)((arr), ((i) + 1), (length)));
    signed int  *total = ((concatArr)((section1), (i), (section2), (((length) - (i)) - 1)));
    ((((_cilk_frame)->header).entry) = 1);
    /* TODO: save only live, dirty variables */;
    ((((_cilk_frame)->scope364).i) = (i));
    ((((_cilk_frame)->scope366).partial) = (partial));
    ((((_cilk_frame)->scope367).section1) = (section1));
    ((((_cilk_frame)->scope368).section2) = (section2));
    ((((_cilk_frame)->scope369).total) = (total));
    ;
    ;
    ((((_cilk_frame)->scope360).arr) = (arr));
    ((((_cilk_frame)->scope360).length) = (length));
    /* expand CILK2C_BEFORE_SPAWN_SLOW() macro */;
    ((Cilk_cilk2c_before_spawn_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    /* expand CILK2C_PUSH_FRAME() macro */;
    ((Cilk_cilk2c_push_frame)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((partial) = ((c_selection_sort)((_cilk_ws), (total), ((length) - 1))));
    ((((_cilk_frame)->scope366).partial) = (partial));
    {
      /* expand CILK2C_XPOP_FRAME_RESULT() macro */;
      signed int  *__tmp79;
      if (((Cilk_cilk2c_pop_check)((_cilk_ws))))
      {
        ((__tmp79) = (partial));
        if (((Cilk_exception_handler)((_cilk_ws), (&(__tmp79)), (sizeof((__tmp79))))))
        {
          ((Cilk_cilk2c_pop)((_cilk_ws)));
          return ;
        } else {
          ;
        }
      } else {
        ;
      }
    }
    /* TODO: restore only live variables */;
    ((i) = (((_cilk_frame)->scope364).i));
    ((partial) = (((_cilk_frame)->scope366).partial));
    ((section1) = (((_cilk_frame)->scope367).section1));
    ((section2) = (((_cilk_frame)->scope368).section2));
    ((total) = (((_cilk_frame)->scope369).total));
    ;
    ;
    ((arr) = (((_cilk_frame)->scope360).arr));
    ((length) = (((_cilk_frame)->scope360).length));
    /* expand CILK2C_AFTER_SPAWN_SLOW() macro */;
    ((Cilk_cilk2c_after_spawn_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    /* TODO: save only live, dirty variables */;
    ((((_cilk_frame)->scope364).i) = (i));
    ((((_cilk_frame)->scope366).partial) = (partial));
    ((((_cilk_frame)->scope367).section1) = (section1));
    ((((_cilk_frame)->scope368).section2) = (section2));
    ((((_cilk_frame)->scope369).total) = (total));
    ;
    ;
    ((((_cilk_frame)->scope360).arr) = (arr));
    ((((_cilk_frame)->scope360).length) = (length));
    if (0)
    {
      _cilk_sync1:;
      /* TODO: restore only live variables */;
      ((i) = (((_cilk_frame)->scope364).i));
      ((partial) = (((_cilk_frame)->scope366).partial));
      ((section1) = (((_cilk_frame)->scope367).section1));
      ((section2) = (((_cilk_frame)->scope368).section2));
      ((total) = (((_cilk_frame)->scope369).total));
      ;
      ;
      ((arr) = (((_cilk_frame)->scope360).arr));
      ((length) = (((_cilk_frame)->scope360).length));
    } else {
      ;
    }
    /* expand CILK2C_AT_THREAD_BOUNDARY_SLOW() macro */;
    ((Cilk_cilk2c_at_thread_boundary_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
    /* expand CILK2C_BEFORE_SYNC_SLOW() macro */;
    ((Cilk_cilk2c_before_sync_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((((_cilk_frame)->header).entry) = 2);
    /* TODO: save only live, dirty variables */;
    ((((_cilk_frame)->scope364).i) = (i));
    ((((_cilk_frame)->scope366).partial) = (partial));
    ((((_cilk_frame)->scope367).section1) = (section1));
    ((((_cilk_frame)->scope368).section2) = (section2));
    ((((_cilk_frame)->scope369).total) = (total));
    ;
    ;
    ((((_cilk_frame)->scope360).arr) = (arr));
    ((((_cilk_frame)->scope360).length) = (length));
    if (((Cilk_sync)((_cilk_ws))))
    {
      return ;
      _cilk_sync2:;
    } else {
      ;
    }
    /* TODO: restore only live variables */;
    ((i) = (((_cilk_frame)->scope364).i));
    ((partial) = (((_cilk_frame)->scope366).partial));
    ((section1) = (((_cilk_frame)->scope367).section1));
    ((section2) = (((_cilk_frame)->scope368).section2));
    ((total) = (((_cilk_frame)->scope369).total));
    ;
    ;
    ((arr) = (((_cilk_frame)->scope360).arr));
    ((length) = (((_cilk_frame)->scope360).length));
    /* expand CILK2C_AFTER_SYNC_SLOW() macro */;
    ((Cilk_cilk2c_after_sync_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    /* expand CILK2C_AT_THREAD_BOUNDARY_SLOW() macro */;
    ((Cilk_cilk2c_at_thread_boundary_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
    signed int  *newOne = ((malloc)((sizeof(signed int))));
    (((newOne)[0]) = ((arr)[(i)]));
    signed int  *result = ((concatArr)((newOne), 1, (partial), ((length) - 1)));
    ((free)((section1)));
    ((free)((section2)));
    ((free)((partial)));
    ((free)((total)));
    ((free)((newOne)));
    {
      signed int  *__tmp80 = (result);
      ((Cilk_set_result)((_cilk_ws), (&(__tmp80)), (sizeof((__tmp80)))));
      /* expand CILK2C_BEFORE_RETURN_SLOW macro */;
      ((Cilk_cilk2c_before_return_slow_cp)((_cilk_ws), (&((_cilk_frame)->header))));
      ((Cilk_cilk2c_before_return_slow)((_cilk_ws), (&((_cilk_frame)->header)), (sizeof((*(_cilk_frame))))));
      return ;
    }
  }
  /* expand CILK2C_BEFORE_SYNC_SLOW() macro */;
  ((Cilk_cilk2c_before_sync_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
  ((((_cilk_frame)->header).entry) = 3);
  /* TODO: save only live, dirty variables */;
  ;
  ;
  ((((_cilk_frame)->scope360).arr) = (arr));
  ((((_cilk_frame)->scope360).length) = (length));
  if (((Cilk_sync)((_cilk_ws))))
  {
    return ;
    _cilk_sync3:;
  } else {
    ;
  }
  /* TODO: restore only live variables */;
  ;
  ;
  ((arr) = (((_cilk_frame)->scope360).arr));
  ((length) = (((_cilk_frame)->scope360).length));
  /* expand CILK2C_AFTER_SYNC_SLOW() macro */;
  ((Cilk_cilk2c_after_sync_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
  /* expand CILK2C_AT_THREAD_BOUNDARY_SLOW() macro */;
  ((Cilk_cilk2c_at_thread_boundary_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
  ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
}

#undef CILK_WHERE_AM_I
#define CILK_WHERE_AM_I IN_C_CODE

static CilkProcInfo _cilk_c_selection_sort_sig[] = {{(sizeof(signed int)), (sizeof(struct _cilk_c_selection_sort_frame)), (_cilk_c_selection_sort_slow), 0, 0}, {(sizeof(signed int *)), ((size_t)(((char *)(&((((struct _cilk_c_selection_sort_frame *)0)->scope366).partial))) - ((char *)((struct _cilk_c_selection_sort_frame *)0)))), 0, 0, 0}, {0, 0, 0, 0, 0}, {0, 0, 0, 0, 0}};

#undef CILK_WHERE_AM_I
#define CILK_WHERE_AM_I IN_FAST_PROCEDURE

signed int  *c_selection_sort(CilkWorkerState  *const  _cilk_ws, signed int  * arr, signed int  length)
{

  
  /* declare _cilk_frame and expand CILK2C_INIT_FRAME() macro */;
  struct _cilk_c_selection_sort_frame  *_cilk_frame = ((Cilk_cilk2c_init_frame)((_cilk_ws), (sizeof(struct _cilk_c_selection_sort_frame)), (_cilk_c_selection_sort_sig)));
  /* expand CILK2C_START_THREAD_FAST() macro */;
  ((Cilk_cilk2c_start_thread_fast_cp)((_cilk_ws), (&((_cilk_frame)->header))));
  ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
  {
    if (((length) < 2))
    {
      {
        {
          signed int  *_cilk_tmp = ((copyArr)((arr), 0, (length)));
          /* expand CILK2C_BEFORE_RETURN_FAST() macro */;
          ((Cilk_cilk2c_before_return_fast_cp)((_cilk_ws), (&((_cilk_frame)->header))));
          ((Cilk_cilk2c_before_return_fast)((_cilk_ws), (&((_cilk_frame)->header)), (sizeof((*(_cilk_frame))))));
          return (_cilk_tmp);
        }
      }
    } else {
      ;
    }
    signed int i = ((minIndex)((arr), (length)));
    signed int  *partial;
    signed int  *section1 = ((copyArr)((arr), 0, (i)));
    signed int  *section2 = ((copyArr)((arr), ((i) + 1), (length)));
    signed int  *total = ((concatArr)((section1), (i), (section2), (((length) - (i)) - 1)));
    ((((_cilk_frame)->header).entry) = 1);
    /* TODO: save only live, dirty variables */;
    ((((_cilk_frame)->scope364).i) = (i));
    ((((_cilk_frame)->scope366).partial) = (partial));
    ((((_cilk_frame)->scope367).section1) = (section1));
    ((((_cilk_frame)->scope368).section2) = (section2));
    ((((_cilk_frame)->scope369).total) = (total));
    ;
    ;
    ((((_cilk_frame)->scope360).arr) = (arr));
    ((((_cilk_frame)->scope360).length) = (length));
    /* expand CILK2C_BEFORE_SPAWN_FAST() macro */;
    ((Cilk_cilk2c_before_spawn_fast_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    /* expand CILK2C_PUSH_FRAME() macro */;
    ((Cilk_cilk2c_push_frame)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((partial) = ((c_selection_sort)((_cilk_ws), (total), ((length) - 1))));
    {
      /* expand CILK2C_XPOP_FRAME_RESULT() macro */;
      signed int  *__tmp82;
      if (((Cilk_cilk2c_pop_check)((_cilk_ws))))
      {
        ((__tmp82) = (partial));
        if (((Cilk_exception_handler)((_cilk_ws), (&(__tmp82)), (sizeof((__tmp82))))))
        {
          ((Cilk_cilk2c_pop)((_cilk_ws)));
          return 0;
        } else {
          ;
        }
      } else {
        ;
      }
    }
    /* expand CILK2C_AFTER_SPAWN_FAST() macro */;
    ((Cilk_cilk2c_after_spawn_fast_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
    /* expand CILK2C_AT_SYNC_FAST() macro */;
    ((Cilk_cilk2c_at_sync_fast_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
    signed int  *newOne = ((malloc)((sizeof(signed int))));
    (((newOne)[0]) = ((arr)[(i)]));
    signed int  *result = ((concatArr)((newOne), 1, (partial), ((length) - 1)));
    ((free)((section1)));
    ((free)((section2)));
    ((free)((partial)));
    ((free)((total)));
    ((free)((newOne)));
    {
      signed int  *_cilk_tmp = (result);
      /* expand CILK2C_BEFORE_RETURN_FAST() macro */;
      ((Cilk_cilk2c_before_return_fast_cp)((_cilk_ws), (&((_cilk_frame)->header))));
      ((Cilk_cilk2c_before_return_fast)((_cilk_ws), (&((_cilk_frame)->header)), (sizeof((*(_cilk_frame))))));
      return (_cilk_tmp);
    }
  }
  /* expand CILK2C_AT_SYNC_FAST() macro */;
  ((Cilk_cilk2c_at_sync_fast_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
  ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
}

#undef CILK_WHERE_AM_I
#define CILK_WHERE_AM_I IN_C_CODE

static void _cilk_c_selection_sort_import(CilkWorkerState  *const  _cilk_ws, void  * _cilk_procargs_v)
{

  ((void)(_cilk_ws));
  ((void)(_cilk_procargs_v));
  ((((struct _cilk_c_selection_sort_args *)(_cilk_procargs_v))->_cilk_proc_result) = ((c_selection_sort)((_cilk_ws), (((struct _cilk_c_selection_sort_args *)(_cilk_procargs_v))->arr), (((struct _cilk_c_selection_sort_args *)(_cilk_procargs_v))->length))));
}

#undef CILK_WHERE_AM_I
#define CILK_WHERE_AM_I IN_C_CODE

signed int  *mt_c_selection_sort(CilkContext  *const  context, signed int  * arr, signed int  length)
{

  struct _cilk_c_selection_sort_args  *_cilk_procargs = ((struct _cilk_c_selection_sort_args *)((Cilk_malloc_fixed)((sizeof(struct _cilk_c_selection_sort_args)))));
  (((_cilk_procargs)->arr) = (arr));
  (((_cilk_procargs)->length) = (length));
  ;
  ((Cilk_start)((context), (_cilk_c_selection_sort_import), (_cilk_procargs), (sizeof(signed int))));
  signed int  *_cilk_proc_result = ((_cilk_procargs)->_cilk_proc_result);
  ((Cilk_free)((_cilk_procargs)));
  return (_cilk_proc_result);
}
YN  *getVoteSearch(signed int  * arr, signed int  size)
{

  {
    signed int  *sorted;
    ((sorted) = ((selection_sort)((arr), (size))));
    signed int result = ((sorted)[0]);
    if (((result) > 1000000000))
    {
      {
        ((free)((sorted)));
        return ((Yes)());
      }
    } else {
      ;
    }
    ((free)((sorted)));
    return ((No)());
  }
}
struct _cilk_getVoteSearchCilk_frame {
  CilkStackFrame header;
  struct  {
    signed int size;
    signed int  *arr;
    
  } scope397;
  struct  {
    signed int  *sorted;
    
  } scope398;
  struct  {
    signed int result;
    
  } scope401;
  
};
struct _cilk_getVoteSearchCilk_args {
  YN  *_cilk_proc_result;
  signed int  *arr;
  signed int size;
  
};

#undef CILK_WHERE_AM_I
#define CILK_WHERE_AM_I IN_SLOW_PROCEDURE

static void _cilk_getVoteSearchCilk_slow(CilkWorkerState  *const  _cilk_ws, struct _cilk_getVoteSearchCilk_frame  * _cilk_frame)
{

  
  signed int  *arr;
  signed int size;
  ;
  /* expand CILK2C_START_THREAD_SLOW() macro */;
  ((Cilk_cilk2c_start_thread_slow_cp)((_cilk_ws), (&((_cilk_frame)->header))));
  ((Cilk_cilk2c_start_thread_slow)((_cilk_ws), (&((_cilk_frame)->header))));
  switch (_cilk_frame->header.entry) {case 3: goto _cilk_sync3; case 2: goto _cilk_sync2; case 1: goto _cilk_sync1; }
  /* TODO: restore only live variables */;
  ;
  ;
  {
    signed int  *sorted;
    ((((_cilk_frame)->header).entry) = 1);
    /* TODO: save only live, dirty variables */;
    ((((_cilk_frame)->scope398).sorted) = (sorted));
    ;
    ;
    ((((_cilk_frame)->scope397).arr) = (arr));
    ((((_cilk_frame)->scope397).size) = (size));
    /* expand CILK2C_BEFORE_SPAWN_SLOW() macro */;
    ((Cilk_cilk2c_before_spawn_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    /* expand CILK2C_PUSH_FRAME() macro */;
    ((Cilk_cilk2c_push_frame)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((sorted) = ((c_selection_sort)((_cilk_ws), (arr), (size))));
    ((((_cilk_frame)->scope398).sorted) = (sorted));
    {
      /* expand CILK2C_XPOP_FRAME_RESULT() macro */;
      signed int  *__tmp88;
      if (((Cilk_cilk2c_pop_check)((_cilk_ws))))
      {
        ((__tmp88) = (sorted));
        if (((Cilk_exception_handler)((_cilk_ws), (&(__tmp88)), (sizeof((__tmp88))))))
        {
          ((Cilk_cilk2c_pop)((_cilk_ws)));
          return ;
        } else {
          ;
        }
      } else {
        ;
      }
    }
    /* TODO: restore only live variables */;
    ((sorted) = (((_cilk_frame)->scope398).sorted));
    ;
    ;
    ((arr) = (((_cilk_frame)->scope397).arr));
    ((size) = (((_cilk_frame)->scope397).size));
    /* expand CILK2C_AFTER_SPAWN_SLOW() macro */;
    ((Cilk_cilk2c_after_spawn_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    /* TODO: save only live, dirty variables */;
    ((((_cilk_frame)->scope398).sorted) = (sorted));
    ;
    ;
    ((((_cilk_frame)->scope397).arr) = (arr));
    ((((_cilk_frame)->scope397).size) = (size));
    if (0)
    {
      _cilk_sync1:;
      /* TODO: restore only live variables */;
      ((sorted) = (((_cilk_frame)->scope398).sorted));
      ;
      ;
      ((arr) = (((_cilk_frame)->scope397).arr));
      ((size) = (((_cilk_frame)->scope397).size));
    } else {
      ;
    }
    /* expand CILK2C_AT_THREAD_BOUNDARY_SLOW() macro */;
    ((Cilk_cilk2c_at_thread_boundary_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
    /* expand CILK2C_BEFORE_SYNC_SLOW() macro */;
    ((Cilk_cilk2c_before_sync_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((((_cilk_frame)->header).entry) = 2);
    /* TODO: save only live, dirty variables */;
    ((((_cilk_frame)->scope398).sorted) = (sorted));
    ;
    ;
    ((((_cilk_frame)->scope397).arr) = (arr));
    ((((_cilk_frame)->scope397).size) = (size));
    if (((Cilk_sync)((_cilk_ws))))
    {
      return ;
      _cilk_sync2:;
    } else {
      ;
    }
    /* TODO: restore only live variables */;
    ((sorted) = (((_cilk_frame)->scope398).sorted));
    ;
    ;
    ((arr) = (((_cilk_frame)->scope397).arr));
    ((size) = (((_cilk_frame)->scope397).size));
    /* expand CILK2C_AFTER_SYNC_SLOW() macro */;
    ((Cilk_cilk2c_after_sync_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    /* expand CILK2C_AT_THREAD_BOUNDARY_SLOW() macro */;
    ((Cilk_cilk2c_at_thread_boundary_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
    signed int result = ((sorted)[0]);
    if (((result) > 1000000000))
    {
      {
        ((free)((sorted)));
        {
          YN  *__tmp89 = ((Yes)());
          ((Cilk_set_result)((_cilk_ws), (&(__tmp89)), (sizeof((__tmp89)))));
          /* expand CILK2C_BEFORE_RETURN_SLOW macro */;
          ((Cilk_cilk2c_before_return_slow_cp)((_cilk_ws), (&((_cilk_frame)->header))));
          ((Cilk_cilk2c_before_return_slow)((_cilk_ws), (&((_cilk_frame)->header)), (sizeof((*(_cilk_frame))))));
          return ;
        }
      }
    } else {
      ;
    }
    ((free)((sorted)));
    {
      YN  *__tmp90 = ((No)());
      ((Cilk_set_result)((_cilk_ws), (&(__tmp90)), (sizeof((__tmp90)))));
      /* expand CILK2C_BEFORE_RETURN_SLOW macro */;
      ((Cilk_cilk2c_before_return_slow_cp)((_cilk_ws), (&((_cilk_frame)->header))));
      ((Cilk_cilk2c_before_return_slow)((_cilk_ws), (&((_cilk_frame)->header)), (sizeof((*(_cilk_frame))))));
      return ;
    }
  }
  /* expand CILK2C_BEFORE_SYNC_SLOW() macro */;
  ((Cilk_cilk2c_before_sync_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
  ((((_cilk_frame)->header).entry) = 3);
  /* TODO: save only live, dirty variables */;
  ;
  ;
  ((((_cilk_frame)->scope397).arr) = (arr));
  ((((_cilk_frame)->scope397).size) = (size));
  if (((Cilk_sync)((_cilk_ws))))
  {
    return ;
    _cilk_sync3:;
  } else {
    ;
  }
  /* TODO: restore only live variables */;
  ;
  ;
  ((arr) = (((_cilk_frame)->scope397).arr));
  ((size) = (((_cilk_frame)->scope397).size));
  /* expand CILK2C_AFTER_SYNC_SLOW() macro */;
  ((Cilk_cilk2c_after_sync_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
  /* expand CILK2C_AT_THREAD_BOUNDARY_SLOW() macro */;
  ((Cilk_cilk2c_at_thread_boundary_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
  ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
}

#undef CILK_WHERE_AM_I
#define CILK_WHERE_AM_I IN_C_CODE

static CilkProcInfo _cilk_getVoteSearchCilk_sig[] = {{(sizeof(YN)), (sizeof(struct _cilk_getVoteSearchCilk_frame)), (_cilk_getVoteSearchCilk_slow), 0, 0}, {(sizeof(signed int *)), ((size_t)(((char *)(&((((struct _cilk_getVoteSearchCilk_frame *)0)->scope398).sorted))) - ((char *)((struct _cilk_getVoteSearchCilk_frame *)0)))), 0, 0, 0}, {0, 0, 0, 0, 0}, {0, 0, 0, 0, 0}};

#undef CILK_WHERE_AM_I
#define CILK_WHERE_AM_I IN_FAST_PROCEDURE

YN  *getVoteSearchCilk(CilkWorkerState  *const  _cilk_ws, signed int  * arr, signed int  size)
{

  
  /* declare _cilk_frame and expand CILK2C_INIT_FRAME() macro */;
  struct _cilk_getVoteSearchCilk_frame  *_cilk_frame = ((Cilk_cilk2c_init_frame)((_cilk_ws), (sizeof(struct _cilk_getVoteSearchCilk_frame)), (_cilk_getVoteSearchCilk_sig)));
  /* expand CILK2C_START_THREAD_FAST() macro */;
  ((Cilk_cilk2c_start_thread_fast_cp)((_cilk_ws), (&((_cilk_frame)->header))));
  ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
  {
    signed int  *sorted;
    ((((_cilk_frame)->header).entry) = 1);
    /* TODO: save only live, dirty variables */;
    ((((_cilk_frame)->scope398).sorted) = (sorted));
    ;
    ;
    ((((_cilk_frame)->scope397).arr) = (arr));
    ((((_cilk_frame)->scope397).size) = (size));
    /* expand CILK2C_BEFORE_SPAWN_FAST() macro */;
    ((Cilk_cilk2c_before_spawn_fast_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    /* expand CILK2C_PUSH_FRAME() macro */;
    ((Cilk_cilk2c_push_frame)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((sorted) = ((c_selection_sort)((_cilk_ws), (arr), (size))));
    {
      /* expand CILK2C_XPOP_FRAME_RESULT() macro */;
      signed int  *__tmp92;
      if (((Cilk_cilk2c_pop_check)((_cilk_ws))))
      {
        ((__tmp92) = (sorted));
        if (((Cilk_exception_handler)((_cilk_ws), (&(__tmp92)), (sizeof((__tmp92))))))
        {
          ((Cilk_cilk2c_pop)((_cilk_ws)));
          return 0;
        } else {
          ;
        }
      } else {
        ;
      }
    }
    /* expand CILK2C_AFTER_SPAWN_FAST() macro */;
    ((Cilk_cilk2c_after_spawn_fast_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
    /* expand CILK2C_AT_SYNC_FAST() macro */;
    ((Cilk_cilk2c_at_sync_fast_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
    signed int result = ((sorted)[0]);
    if (((result) > 1000000000))
    {
      {
        ((free)((sorted)));
        {
          YN  *_cilk_tmp = ((Yes)());
          /* expand CILK2C_BEFORE_RETURN_FAST() macro */;
          ((Cilk_cilk2c_before_return_fast_cp)((_cilk_ws), (&((_cilk_frame)->header))));
          ((Cilk_cilk2c_before_return_fast)((_cilk_ws), (&((_cilk_frame)->header)), (sizeof((*(_cilk_frame))))));
          return (_cilk_tmp);
        }
      }
    } else {
      ;
    }
    ((free)((sorted)));
    {
      YN  *_cilk_tmp = ((No)());
      /* expand CILK2C_BEFORE_RETURN_FAST() macro */;
      ((Cilk_cilk2c_before_return_fast_cp)((_cilk_ws), (&((_cilk_frame)->header))));
      ((Cilk_cilk2c_before_return_fast)((_cilk_ws), (&((_cilk_frame)->header)), (sizeof((*(_cilk_frame))))));
      return (_cilk_tmp);
    }
  }
  /* expand CILK2C_AT_SYNC_FAST() macro */;
  ((Cilk_cilk2c_at_sync_fast_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
  ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
}

#undef CILK_WHERE_AM_I
#define CILK_WHERE_AM_I IN_C_CODE

static void _cilk_getVoteSearchCilk_import(CilkWorkerState  *const  _cilk_ws, void  * _cilk_procargs_v)
{

  ((void)(_cilk_ws));
  ((void)(_cilk_procargs_v));
  ((((struct _cilk_getVoteSearchCilk_args *)(_cilk_procargs_v))->_cilk_proc_result) = ((getVoteSearchCilk)((_cilk_ws), (((struct _cilk_getVoteSearchCilk_args *)(_cilk_procargs_v))->arr), (((struct _cilk_getVoteSearchCilk_args *)(_cilk_procargs_v))->size))));
}

#undef CILK_WHERE_AM_I
#define CILK_WHERE_AM_I IN_C_CODE

YN  *mt_getVoteSearchCilk(CilkContext  *const  context, signed int  * arr, signed int  size)
{

  struct _cilk_getVoteSearchCilk_args  *_cilk_procargs = ((struct _cilk_getVoteSearchCilk_args *)((Cilk_malloc_fixed)((sizeof(struct _cilk_getVoteSearchCilk_args)))));
  (((_cilk_procargs)->arr) = (arr));
  (((_cilk_procargs)->size) = (size));
  ;
  ((Cilk_start)((context), (_cilk_getVoteSearchCilk_import), (_cilk_procargs), (sizeof(YN))));
  YN  *_cilk_proc_result = ((_cilk_procargs)->_cilk_proc_result);
  ((Cilk_free)((_cilk_procargs)));
  return (_cilk_proc_result);
}
typedef VoteSet  *_template_param_unused_93;
typedef __attribute__(()) struct _template__Lattice__pointer__tag_struct_VoteSet_58__ _template__Lattice__pointer__tag_struct_VoteSet_58__;
struct _template__Lattice__pointer__tag_struct_VoteSet_58__ {
  VoteSet  *_bottom;
  VoteSet  *_top;
  signed int ( *_leq)();
  VoteSet  *( *_lub)();
  signed int ( *_eq)();
  struct _string_s ( *_show)();
  
};
typedef VoteSet  *_template_param_unused_97;
static struct _template__Lattice__pointer__tag_struct_VoteSet_58__  *_template__newLattice__pointer__tag_struct_VoteSet_58__(VoteSet  * least, VoteSet  * greatest, signed int ( * leq)(), VoteSet  *( * lub)(), signed int ( * eq)(), struct _string_s ( * showMethod)())
{

  {
    struct _template__Lattice__pointer__tag_struct_VoteSet_58__  *l = ((malloc)((sizeof(struct _template__Lattice__pointer__tag_struct_VoteSet_58__))));
    (((l)->_bottom) = (least));
    (((l)->_top) = (greatest));
    (((l)->_leq) = (leq));
    (((l)->_lub) = (lub));
    (((l)->_eq) = (eq));
    (((l)->_show) = (showMethod));
    return (l);
  }
}
typedef VoteSet  *_template_param_unused_98;
typedef __attribute__(()) struct _template__Lvar__pointer__tag_struct_VoteSet_58__ _template__Lvar__pointer__tag_struct_VoteSet_58__;
typedef VoteSet  *_template_param_unused_99;
typedef __attribute__(()) struct _template__ThresholdSet__pointer__tag_struct_VoteSet_58__ _template__ThresholdSet__pointer__tag_struct_VoteSet_58__;
typedef VoteSet  *_template_param_unused_100;
typedef __attribute__(()) struct _template__ActivationSet__pointer__tag_struct_VoteSet_58__ _template__ActivationSet__pointer__tag_struct_VoteSet_58__;
struct _template__ActivationSet__pointer__tag_struct_VoteSet_58__ {
  signed int _size;
  VoteSet  * *_set;
  signed int _index;
  struct _template__Lattice__pointer__tag_struct_VoteSet_58__  *_lattice;
  
};
struct _template__ThresholdSet__pointer__tag_struct_VoteSet_58__ {
  struct _template__Lattice__pointer__tag_struct_VoteSet_58__  *_lattice;
  signed int _size;
  signed int _index;
  struct _template__ActivationSet__pointer__tag_struct_VoteSet_58__  * *_a_sets;
  
};
struct _template__Lvar__pointer__tag_struct_VoteSet_58__ {
  struct _template__Lattice__pointer__tag_struct_VoteSet_58__  *_lattice;
  VoteSet  *_value;
  signed int _frozen;
  struct _template__ThresholdSet__pointer__tag_struct_VoteSet_58__  *_threshold;
  pthread_mutex_t _mutex;
  pthread_cond_t _cond;
  
};
typedef VoteSet  *_template_param_unused_104;
static struct _template__Lvar__pointer__tag_struct_VoteSet_58__  *_template__new__pointer__tag_struct_VoteSet_58__(struct _template__Lattice__pointer__tag_struct_VoteSet_58__  * l)
{

  {
    struct _template__Lvar__pointer__tag_struct_VoteSet_58__  *lvarNew = ((malloc)((sizeof(struct _template__Lvar__pointer__tag_struct_VoteSet_58__))));
    (((lvarNew)->_value) = ((l)->_bottom));
    (((lvarNew)->_lattice) = (l));
    (((lvarNew)->_frozen) = 0);
    (((lvarNew)->_cond) = ((pthread_cond_t){{0, 0, 0, 0, 0, ((void *)0), 0, 0}}));
    (((lvarNew)->_mutex) = ((pthread_mutex_t){{0, 0, 0, 0, 0, 0, 0, {0, 0}}}));
    return (lvarNew);
  }
}
typedef VoteSet  *_template_param_unused_108;
static struct _template__ActivationSet__pointer__tag_struct_VoteSet_58__  *_template__newActivationSet__pointer__tag_struct_VoteSet_58__(struct _template__Lattice__pointer__tag_struct_VoteSet_58__  * l, signed int  size)
{

  {
    struct _template__ActivationSet__pointer__tag_struct_VoteSet_58__  *act = ((malloc)((sizeof(struct _template__ActivationSet__pointer__tag_struct_VoteSet_58__))));
    (((act)->_size) = (size));
    (((act)->_set) = ((malloc)(((sizeof(VoteSet *)) * (size)))));
    (((act)->_index) = 0);
    (((act)->_lattice) = (l));
    return (act);
  }
}
typedef VoteSet  *_template_param_unused_124;
typedef VoteSet  *_template_param_unused_128;
static signed int _template__resizeActSet__pointer__tag_struct_VoteSet_58__(struct _template__ActivationSet__pointer__tag_struct_VoteSet_58__  * act, signed int  newSize)
{

  {
    VoteSet  * *newSet = ((malloc)(((sizeof(VoteSet * *)) * (newSize))));
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
static struct _template__ActivationSet__pointer__tag_struct_VoteSet_58__  *_template__addAct__pointer__tag_struct_VoteSet_58__(struct _template__ActivationSet__pointer__tag_struct_VoteSet_58__  * act, VoteSet  * element)
{

  {
    if ((((act)->_index) >= ((act)->_size)))
    {
      {
        ((_template__resizeActSet__pointer__tag_struct_VoteSet_58__)((act), ((2 * ((act)->_size)) + 1)));
      }
    } else {
      ;
    }
    ((((act)->_set)[((act)->_index)]) = (element));
    (((act)->_index)++);
    return (act);
  }
}
typedef VoteSet  *_template_param_unused_172;
typedef VoteSet  *_template_param_unused_176;
static signed int _template__resizeThresholdSet__pointer__tag_struct_VoteSet_58__(struct _template__ThresholdSet__pointer__tag_struct_VoteSet_58__  * t, signed int  newSize)
{

  {
    struct _template__ActivationSet__pointer__tag_struct_VoteSet_58__  * *newSet = ((malloc)(((sizeof(struct _template__ActivationSet__pointer__tag_struct_VoteSet_58__ *)) * (newSize))));
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
static struct _template__ThresholdSet__pointer__tag_struct_VoteSet_58__  *_template__addThreshold__pointer__tag_struct_VoteSet_58__(struct _template__ThresholdSet__pointer__tag_struct_VoteSet_58__  * t, struct _template__ActivationSet__pointer__tag_struct_VoteSet_58__  * act)
{

  {
    if ((((t)->_index) >= ((t)->_size)))
    {
      {
        ((_template__resizeThresholdSet__pointer__tag_struct_VoteSet_58__)((t), ((2 * ((t)->_size)) + 1)));
      }
    } else {
      ;
    }
    ((((t)->_a_sets)[((t)->_index)]) = (act));
    (((t)->_index)++);
    return (t);
  }
}
typedef VoteSet  *_template_param_unused_184;
static struct _template__ThresholdSet__pointer__tag_struct_VoteSet_58__  *_template__newThresholdSet__pointer__tag_struct_VoteSet_58__(struct _template__Lattice__pointer__tag_struct_VoteSet_58__  * l, signed int  size)
{

  {
    struct _template__ThresholdSet__pointer__tag_struct_VoteSet_58__  *t = ((malloc)((sizeof(struct _template__ThresholdSet__pointer__tag_struct_VoteSet_58__))));
    (((t)->_lattice) = (l));
    (((t)->_size) = (size));
    (((t)->_index) = 0);
    (((t)->_a_sets) = ((malloc)(((sizeof(struct _template__ActivationSet__pointer__tag_struct_VoteSet_58__ *)) * (size)))));
    return (t);
  }
}
typedef VoteSet  *_template_param_unused_188;
static signed int _template__put__pointer__tag_struct_VoteSet_58__(struct _template__Lvar__pointer__tag_struct_VoteSet_58__  * l, VoteSet  * newState)
{

  {
    if (((l)->_frozen))
    {
      {
        return 0;
      }
    } else {
      ;
    }
    ((pthread_mutex_lock)((&(((l)->_mutex)))));
    VoteSet  *oldState = ((l)->_value);
    VoteSet  *newValue = ((((l)->_lattice)->_lub)((oldState), (newState)));
    if (((((l)->_lattice)->_eq)((((l)->_lattice)->_top), (newValue))))
    {
      {
        ((printf)("Error: invalid put of %s\n", (((((l)->_lattice)->_show)((newState))).text)));
        ((exit)(0));
      }
    } else {
      ;
    }
    (((l)->_value) = (newValue));
    ((pthread_cond_broadcast)((&(((l)->_cond)))));
    ((pthread_mutex_unlock)((&(((l)->_mutex)))));
    return 1;
  }
}
typedef VoteSet  *_template_param_unused_264;
typedef VoteSet  *_template_param_unused_280;
typedef VoteSet  *_template_param_unused_282;
typedef __attribute__(()) struct _template__putStruct__pointer__tag_struct_VoteSet_58__ _template__putStruct__pointer__tag_struct_VoteSet_58__;
struct _template__putStruct__pointer__tag_struct_VoteSet_58__ {
  struct _template__Lvar__pointer__tag_struct_VoteSet_58__  *_lvar;
  VoteSet  *_val;
  
};
typedef VoteSet  *_template_param_unused_284;
static void  *_template__putVoid__pointer__tag_struct_VoteSet_58__(void  * valStruct)
{

  {
    _template__putStruct__pointer__tag_struct_VoteSet_58__  *p = ((_template__putStruct__pointer__tag_struct_VoteSet_58__ *)(valStruct));
    ((_template__put__pointer__tag_struct_VoteSet_58__)(((p)->_lvar), ((p)->_val)));
    ((free)((valStruct)));
  }
}
static signed int _template__declarePut__pointer__tag_struct_VoteSet_58__(struct _template__Lvar__pointer__tag_struct_VoteSet_58__  * l, VoteSet  * value)
{

  {
    pthread_t child;
    _template__putStruct__pointer__tag_struct_VoteSet_58__  *p = ((malloc)((sizeof(_template__putStruct__pointer__tag_struct_VoteSet_58__))));
    (((p)->_lvar) = (l));
    (((p)->_val) = (value));
    ((pthread_create)((&(child)), (((void *)0)), (_template__putVoid__pointer__tag_struct_VoteSet_58__), ((void *)(p))));
  }
}
typedef VoteSet  *_template_param_unused_288;
static struct _template__ActivationSet__pointer__tag_struct_VoteSet_58__  *_template__thresholdReached__pointer__tag_struct_VoteSet_58__(struct _template__Lvar__pointer__tag_struct_VoteSet_58__  * l, struct _template__ThresholdSet__pointer__tag_struct_VoteSet_58__  * t)
{

  {
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
static struct _template__ActivationSet__pointer__tag_struct_VoteSet_58__  *_template__get__pointer__tag_struct_VoteSet_58__(struct _template__Lvar__pointer__tag_struct_VoteSet_58__  * l, struct _template__ThresholdSet__pointer__tag_struct_VoteSet_58__  * t)
{

  {
    ((_template__declarePut__pointer__tag_struct_VoteSet_58__)((l), (((l)->_lattice)->_bottom)));
    ((pthread_mutex_lock)((&(((l)->_mutex)))));
    struct _template__ActivationSet__pointer__tag_struct_VoteSet_58__  *actReached = ((_template__thresholdReached__pointer__tag_struct_VoteSet_58__)((l), (t)));
    while (((actReached) == (((void *)0))))
    {
      {
        ((actReached) = ((_template__thresholdReached__pointer__tag_struct_VoteSet_58__)((l), (t))));
        ((pthread_cond_wait)((&(((l)->_cond))), (&(((l)->_mutex)))));
      }
    }
    ((pthread_mutex_unlock)((&(((l)->_mutex)))));
    return (actReached);
  }
}
signed int nonCilk(signed int  * arr, signed int  size)
{

  {
    struct _template__Lattice__pointer__tag_struct_VoteSet_58__  *D = ((_template__newLattice__pointer__tag_struct_VoteSet_58__)(((Empty)()), ((Top)()), (leq), (lub), (eq), (showVoteSet)));
    struct _template__Lvar__pointer__tag_struct_VoteSet_58__  *votes = ((_template__new__pointer__tag_struct_VoteSet_58__)((D)));
    struct _template__ActivationSet__pointer__tag_struct_VoteSet_58__  *noPizza = ((_template__newActivationSet__pointer__tag_struct_VoteSet_58__)((D), 1));
    ((_template__addAct__pointer__tag_struct_VoteSet_58__)((noPizza), ((Set)(((Horace)(((No)()))), ((Set)(((Kat)(((No)()))), ((Set)(((Franz)(((No)()))), ((Empty)())))))))));
    struct _template__ActivationSet__pointer__tag_struct_VoteSet_58__  *yesPizza = ((_template__newActivationSet__pointer__tag_struct_VoteSet_58__)((D), 20));
    ((_template__addAct__pointer__tag_struct_VoteSet_58__)((yesPizza), ((Set)(((Horace)(((Yes)()))), ((Empty)())))));
    ((_template__addAct__pointer__tag_struct_VoteSet_58__)((yesPizza), ((Set)(((Kat)(((Yes)()))), ((Empty)())))));
    ((_template__addAct__pointer__tag_struct_VoteSet_58__)((yesPizza), ((Set)(((Franz)(((Yes)()))), ((Empty)())))));
    struct _template__ThresholdSet__pointer__tag_struct_VoteSet_58__  *t = ((_template__addThreshold__pointer__tag_struct_VoteSet_58__)(((_template__addThreshold__pointer__tag_struct_VoteSet_58__)(((_template__newThresholdSet__pointer__tag_struct_VoteSet_58__)((D), 2)), (yesPizza))), (noPizza)));
    YN  *kresult;
    YN  *hresult;
    YN  *fresult;
    ((kresult) = ((getVoteSearch)((arr), (size))));
    ((_template__put__pointer__tag_struct_VoteSet_58__)((votes), ((Set)(((Kat)((kresult))), ((Empty)())))));
    ((hresult) = ((getVoteSearch)((arr), (size))));
    ((_template__put__pointer__tag_struct_VoteSet_58__)((votes), ((Set)(((Horace)((hresult))), ((Empty)())))));
    ((fresult) = ((getVoteSearch)((arr), (size))));
    ((_template__put__pointer__tag_struct_VoteSet_58__)((votes), ((Set)(((Franz)((fresult))), ((Empty)())))));
    struct _template__ActivationSet__pointer__tag_struct_VoteSet_58__  *getPiz = ((_template__get__pointer__tag_struct_VoteSet_58__)((votes), (t)));
    if (((getPiz) == (yesPizza)))
    {
      {
        ((printf)("Get pizza! At least one person will eat some.\n"));
        return 1;
      }
    } else {
      ;
    }
    if (((getPiz) == (noPizza)))
    {
      {
        ((printf)("Don't get pizza. Nobody will eat any.\n"));
        return 0;
      }
    } else {
      ;
    }
    ((printf)("Not enough information to get pizza or not!\n"));
    return (-1);
  }
}
struct _cilk_withCilk_frame {
  CilkStackFrame header;
  struct  {
    signed int size;
    signed int  *arr;
    
  } scope447;
  struct  {
    struct _template__Lattice__pointer__tag_struct_VoteSet_58__  *D;
    
  } scope449;
  struct  {
    struct _template__Lvar__pointer__tag_struct_VoteSet_58__  *votes;
    
  } scope450;
  struct  {
    struct _template__ActivationSet__pointer__tag_struct_VoteSet_58__  *noPizza;
    
  } scope452;
  struct  {
    struct _template__ActivationSet__pointer__tag_struct_VoteSet_58__  *yesPizza;
    
  } scope454;
  struct  {
    struct _template__ThresholdSet__pointer__tag_struct_VoteSet_58__  *t;
    
  } scope458;
  struct  {
    YN  *kresult;
    
  } scope460;
  struct  {
    YN  *hresult;
    
  } scope461;
  struct  {
    YN  *fresult;
    
  } scope462;
  struct  {
    struct _template__ActivationSet__pointer__tag_struct_VoteSet_58__  *getPiz;
    
  } scope470;
  
};
struct _cilk_withCilk_args {
  signed int _cilk_proc_result;
  signed int  *arr;
  signed int size;
  
};

#undef CILK_WHERE_AM_I
#define CILK_WHERE_AM_I IN_SLOW_PROCEDURE

static void _cilk_withCilk_slow(CilkWorkerState  *const  _cilk_ws, struct _cilk_withCilk_frame  * _cilk_frame)
{

  
  signed int  *arr;
  signed int size;
  ;
  /* expand CILK2C_START_THREAD_SLOW() macro */;
  ((Cilk_cilk2c_start_thread_slow_cp)((_cilk_ws), (&((_cilk_frame)->header))));
  ((Cilk_cilk2c_start_thread_slow)((_cilk_ws), (&((_cilk_frame)->header))));
  switch (_cilk_frame->header.entry) {case 5: goto _cilk_sync5; case 4: goto _cilk_sync4; case 3: goto _cilk_sync3; case 2: goto _cilk_sync2; case 1: goto _cilk_sync1; }
  /* TODO: restore only live variables */;
  ;
  ;
  {
    struct _template__Lattice__pointer__tag_struct_VoteSet_58__  *D = ((_template__newLattice__pointer__tag_struct_VoteSet_58__)(((Empty)()), ((Top)()), (leq), (lub), (eq), (showVoteSet)));
    struct _template__Lvar__pointer__tag_struct_VoteSet_58__  *votes = ((_template__new__pointer__tag_struct_VoteSet_58__)((D)));
    struct _template__ActivationSet__pointer__tag_struct_VoteSet_58__  *noPizza = ((_template__newActivationSet__pointer__tag_struct_VoteSet_58__)((D), 1));
    ((_template__addAct__pointer__tag_struct_VoteSet_58__)((noPizza), ((Set)(((Horace)(((No)()))), ((Set)(((Kat)(((No)()))), ((Set)(((Franz)(((No)()))), ((Empty)())))))))));
    struct _template__ActivationSet__pointer__tag_struct_VoteSet_58__  *yesPizza = ((_template__newActivationSet__pointer__tag_struct_VoteSet_58__)((D), 20));
    ((_template__addAct__pointer__tag_struct_VoteSet_58__)((yesPizza), ((Set)(((Horace)(((Yes)()))), ((Empty)())))));
    ((_template__addAct__pointer__tag_struct_VoteSet_58__)((yesPizza), ((Set)(((Kat)(((Yes)()))), ((Empty)())))));
    ((_template__addAct__pointer__tag_struct_VoteSet_58__)((yesPizza), ((Set)(((Franz)(((Yes)()))), ((Empty)())))));
    struct _template__ThresholdSet__pointer__tag_struct_VoteSet_58__  *t = ((_template__addThreshold__pointer__tag_struct_VoteSet_58__)(((_template__addThreshold__pointer__tag_struct_VoteSet_58__)(((_template__newThresholdSet__pointer__tag_struct_VoteSet_58__)((D), 2)), (yesPizza))), (noPizza)));
    YN  *kresult;
    YN  *hresult;
    YN  *fresult;
    ((((_cilk_frame)->header).entry) = 1);
    /* TODO: save only live, dirty variables */;
    ((((_cilk_frame)->scope449).D) = (D));
    ((((_cilk_frame)->scope462).fresult) = (fresult));
    ((((_cilk_frame)->scope461).hresult) = (hresult));
    ((((_cilk_frame)->scope460).kresult) = (kresult));
    ((((_cilk_frame)->scope452).noPizza) = (noPizza));
    ((((_cilk_frame)->scope458).t) = (t));
    ((((_cilk_frame)->scope450).votes) = (votes));
    ((((_cilk_frame)->scope454).yesPizza) = (yesPizza));
    ;
    ;
    ((((_cilk_frame)->scope447).arr) = (arr));
    ((((_cilk_frame)->scope447).size) = (size));
    /* expand CILK2C_BEFORE_SPAWN_SLOW() macro */;
    ((Cilk_cilk2c_before_spawn_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    /* expand CILK2C_PUSH_FRAME() macro */;
    ((Cilk_cilk2c_push_frame)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((kresult) = ((getVoteSearchCilk)((_cilk_ws), (arr), (size))));
    ((((_cilk_frame)->scope460).kresult) = (kresult));
    {
      /* expand CILK2C_XPOP_FRAME_RESULT() macro */;
      YN  *__tmp301;
      if (((Cilk_cilk2c_pop_check)((_cilk_ws))))
      {
        ((__tmp301) = (kresult));
        if (((Cilk_exception_handler)((_cilk_ws), (&(__tmp301)), (sizeof((__tmp301))))))
        {
          ((Cilk_cilk2c_pop)((_cilk_ws)));
          return ;
        } else {
          ;
        }
      } else {
        ;
      }
    }
    /* TODO: restore only live variables */;
    ((D) = (((_cilk_frame)->scope449).D));
    ((fresult) = (((_cilk_frame)->scope462).fresult));
    ((hresult) = (((_cilk_frame)->scope461).hresult));
    ((kresult) = (((_cilk_frame)->scope460).kresult));
    ((noPizza) = (((_cilk_frame)->scope452).noPizza));
    ((t) = (((_cilk_frame)->scope458).t));
    ((votes) = (((_cilk_frame)->scope450).votes));
    ((yesPizza) = (((_cilk_frame)->scope454).yesPizza));
    ;
    ;
    ((arr) = (((_cilk_frame)->scope447).arr));
    ((size) = (((_cilk_frame)->scope447).size));
    /* expand CILK2C_AFTER_SPAWN_SLOW() macro */;
    ((Cilk_cilk2c_after_spawn_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    /* TODO: save only live, dirty variables */;
    ((((_cilk_frame)->scope449).D) = (D));
    ((((_cilk_frame)->scope462).fresult) = (fresult));
    ((((_cilk_frame)->scope461).hresult) = (hresult));
    ((((_cilk_frame)->scope460).kresult) = (kresult));
    ((((_cilk_frame)->scope452).noPizza) = (noPizza));
    ((((_cilk_frame)->scope458).t) = (t));
    ((((_cilk_frame)->scope450).votes) = (votes));
    ((((_cilk_frame)->scope454).yesPizza) = (yesPizza));
    ;
    ;
    ((((_cilk_frame)->scope447).arr) = (arr));
    ((((_cilk_frame)->scope447).size) = (size));
    if (0)
    {
      _cilk_sync1:;
      /* TODO: restore only live variables */;
      ((D) = (((_cilk_frame)->scope449).D));
      ((fresult) = (((_cilk_frame)->scope462).fresult));
      ((hresult) = (((_cilk_frame)->scope461).hresult));
      ((kresult) = (((_cilk_frame)->scope460).kresult));
      ((noPizza) = (((_cilk_frame)->scope452).noPizza));
      ((t) = (((_cilk_frame)->scope458).t));
      ((votes) = (((_cilk_frame)->scope450).votes));
      ((yesPizza) = (((_cilk_frame)->scope454).yesPizza));
      ;
      ;
      ((arr) = (((_cilk_frame)->scope447).arr));
      ((size) = (((_cilk_frame)->scope447).size));
    } else {
      ;
    }
    /* expand CILK2C_AT_THREAD_BOUNDARY_SLOW() macro */;
    ((Cilk_cilk2c_at_thread_boundary_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
    ((((_cilk_frame)->header).entry) = 2);
    /* TODO: save only live, dirty variables */;
    ((((_cilk_frame)->scope449).D) = (D));
    ((((_cilk_frame)->scope462).fresult) = (fresult));
    ((((_cilk_frame)->scope461).hresult) = (hresult));
    ((((_cilk_frame)->scope460).kresult) = (kresult));
    ((((_cilk_frame)->scope452).noPizza) = (noPizza));
    ((((_cilk_frame)->scope458).t) = (t));
    ((((_cilk_frame)->scope450).votes) = (votes));
    ((((_cilk_frame)->scope454).yesPizza) = (yesPizza));
    ;
    ;
    ((((_cilk_frame)->scope447).arr) = (arr));
    ((((_cilk_frame)->scope447).size) = (size));
    /* expand CILK2C_BEFORE_SPAWN_SLOW() macro */;
    ((Cilk_cilk2c_before_spawn_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    /* expand CILK2C_PUSH_FRAME() macro */;
    ((Cilk_cilk2c_push_frame)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((hresult) = ((getVoteSearchCilk)((_cilk_ws), (arr), (size))));
    ((((_cilk_frame)->scope461).hresult) = (hresult));
    {
      /* expand CILK2C_XPOP_FRAME_RESULT() macro */;
      YN  *__tmp302;
      if (((Cilk_cilk2c_pop_check)((_cilk_ws))))
      {
        ((__tmp302) = (hresult));
        if (((Cilk_exception_handler)((_cilk_ws), (&(__tmp302)), (sizeof((__tmp302))))))
        {
          ((Cilk_cilk2c_pop)((_cilk_ws)));
          return ;
        } else {
          ;
        }
      } else {
        ;
      }
    }
    /* TODO: restore only live variables */;
    ((D) = (((_cilk_frame)->scope449).D));
    ((fresult) = (((_cilk_frame)->scope462).fresult));
    ((hresult) = (((_cilk_frame)->scope461).hresult));
    ((kresult) = (((_cilk_frame)->scope460).kresult));
    ((noPizza) = (((_cilk_frame)->scope452).noPizza));
    ((t) = (((_cilk_frame)->scope458).t));
    ((votes) = (((_cilk_frame)->scope450).votes));
    ((yesPizza) = (((_cilk_frame)->scope454).yesPizza));
    ;
    ;
    ((arr) = (((_cilk_frame)->scope447).arr));
    ((size) = (((_cilk_frame)->scope447).size));
    /* expand CILK2C_AFTER_SPAWN_SLOW() macro */;
    ((Cilk_cilk2c_after_spawn_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    /* TODO: save only live, dirty variables */;
    ((((_cilk_frame)->scope449).D) = (D));
    ((((_cilk_frame)->scope462).fresult) = (fresult));
    ((((_cilk_frame)->scope461).hresult) = (hresult));
    ((((_cilk_frame)->scope460).kresult) = (kresult));
    ((((_cilk_frame)->scope452).noPizza) = (noPizza));
    ((((_cilk_frame)->scope458).t) = (t));
    ((((_cilk_frame)->scope450).votes) = (votes));
    ((((_cilk_frame)->scope454).yesPizza) = (yesPizza));
    ;
    ;
    ((((_cilk_frame)->scope447).arr) = (arr));
    ((((_cilk_frame)->scope447).size) = (size));
    if (0)
    {
      _cilk_sync2:;
      /* TODO: restore only live variables */;
      ((D) = (((_cilk_frame)->scope449).D));
      ((fresult) = (((_cilk_frame)->scope462).fresult));
      ((hresult) = (((_cilk_frame)->scope461).hresult));
      ((kresult) = (((_cilk_frame)->scope460).kresult));
      ((noPizza) = (((_cilk_frame)->scope452).noPizza));
      ((t) = (((_cilk_frame)->scope458).t));
      ((votes) = (((_cilk_frame)->scope450).votes));
      ((yesPizza) = (((_cilk_frame)->scope454).yesPizza));
      ;
      ;
      ((arr) = (((_cilk_frame)->scope447).arr));
      ((size) = (((_cilk_frame)->scope447).size));
    } else {
      ;
    }
    /* expand CILK2C_AT_THREAD_BOUNDARY_SLOW() macro */;
    ((Cilk_cilk2c_at_thread_boundary_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
    ((((_cilk_frame)->header).entry) = 3);
    /* TODO: save only live, dirty variables */;
    ((((_cilk_frame)->scope449).D) = (D));
    ((((_cilk_frame)->scope462).fresult) = (fresult));
    ((((_cilk_frame)->scope461).hresult) = (hresult));
    ((((_cilk_frame)->scope460).kresult) = (kresult));
    ((((_cilk_frame)->scope452).noPizza) = (noPizza));
    ((((_cilk_frame)->scope458).t) = (t));
    ((((_cilk_frame)->scope450).votes) = (votes));
    ((((_cilk_frame)->scope454).yesPizza) = (yesPizza));
    ;
    ;
    ((((_cilk_frame)->scope447).arr) = (arr));
    ((((_cilk_frame)->scope447).size) = (size));
    /* expand CILK2C_BEFORE_SPAWN_SLOW() macro */;
    ((Cilk_cilk2c_before_spawn_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    /* expand CILK2C_PUSH_FRAME() macro */;
    ((Cilk_cilk2c_push_frame)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((fresult) = ((getVoteSearchCilk)((_cilk_ws), (arr), (size))));
    ((((_cilk_frame)->scope462).fresult) = (fresult));
    {
      /* expand CILK2C_XPOP_FRAME_RESULT() macro */;
      YN  *__tmp303;
      if (((Cilk_cilk2c_pop_check)((_cilk_ws))))
      {
        ((__tmp303) = (fresult));
        if (((Cilk_exception_handler)((_cilk_ws), (&(__tmp303)), (sizeof((__tmp303))))))
        {
          ((Cilk_cilk2c_pop)((_cilk_ws)));
          return ;
        } else {
          ;
        }
      } else {
        ;
      }
    }
    /* TODO: restore only live variables */;
    ((D) = (((_cilk_frame)->scope449).D));
    ((fresult) = (((_cilk_frame)->scope462).fresult));
    ((hresult) = (((_cilk_frame)->scope461).hresult));
    ((kresult) = (((_cilk_frame)->scope460).kresult));
    ((noPizza) = (((_cilk_frame)->scope452).noPizza));
    ((t) = (((_cilk_frame)->scope458).t));
    ((votes) = (((_cilk_frame)->scope450).votes));
    ((yesPizza) = (((_cilk_frame)->scope454).yesPizza));
    ;
    ;
    ((arr) = (((_cilk_frame)->scope447).arr));
    ((size) = (((_cilk_frame)->scope447).size));
    /* expand CILK2C_AFTER_SPAWN_SLOW() macro */;
    ((Cilk_cilk2c_after_spawn_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    /* TODO: save only live, dirty variables */;
    ((((_cilk_frame)->scope449).D) = (D));
    ((((_cilk_frame)->scope462).fresult) = (fresult));
    ((((_cilk_frame)->scope461).hresult) = (hresult));
    ((((_cilk_frame)->scope460).kresult) = (kresult));
    ((((_cilk_frame)->scope452).noPizza) = (noPizza));
    ((((_cilk_frame)->scope458).t) = (t));
    ((((_cilk_frame)->scope450).votes) = (votes));
    ((((_cilk_frame)->scope454).yesPizza) = (yesPizza));
    ;
    ;
    ((((_cilk_frame)->scope447).arr) = (arr));
    ((((_cilk_frame)->scope447).size) = (size));
    if (0)
    {
      _cilk_sync3:;
      /* TODO: restore only live variables */;
      ((D) = (((_cilk_frame)->scope449).D));
      ((fresult) = (((_cilk_frame)->scope462).fresult));
      ((hresult) = (((_cilk_frame)->scope461).hresult));
      ((kresult) = (((_cilk_frame)->scope460).kresult));
      ((noPizza) = (((_cilk_frame)->scope452).noPizza));
      ((t) = (((_cilk_frame)->scope458).t));
      ((votes) = (((_cilk_frame)->scope450).votes));
      ((yesPizza) = (((_cilk_frame)->scope454).yesPizza));
      ;
      ;
      ((arr) = (((_cilk_frame)->scope447).arr));
      ((size) = (((_cilk_frame)->scope447).size));
    } else {
      ;
    }
    /* expand CILK2C_AT_THREAD_BOUNDARY_SLOW() macro */;
    ((Cilk_cilk2c_at_thread_boundary_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
    /* expand CILK2C_BEFORE_SYNC_SLOW() macro */;
    ((Cilk_cilk2c_before_sync_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((((_cilk_frame)->header).entry) = 4);
    /* TODO: save only live, dirty variables */;
    ((((_cilk_frame)->scope449).D) = (D));
    ((((_cilk_frame)->scope462).fresult) = (fresult));
    ((((_cilk_frame)->scope461).hresult) = (hresult));
    ((((_cilk_frame)->scope460).kresult) = (kresult));
    ((((_cilk_frame)->scope452).noPizza) = (noPizza));
    ((((_cilk_frame)->scope458).t) = (t));
    ((((_cilk_frame)->scope450).votes) = (votes));
    ((((_cilk_frame)->scope454).yesPizza) = (yesPizza));
    ;
    ;
    ((((_cilk_frame)->scope447).arr) = (arr));
    ((((_cilk_frame)->scope447).size) = (size));
    if (((Cilk_sync)((_cilk_ws))))
    {
      return ;
      _cilk_sync4:;
    } else {
      ;
    }
    /* TODO: restore only live variables */;
    ((D) = (((_cilk_frame)->scope449).D));
    ((fresult) = (((_cilk_frame)->scope462).fresult));
    ((hresult) = (((_cilk_frame)->scope461).hresult));
    ((kresult) = (((_cilk_frame)->scope460).kresult));
    ((noPizza) = (((_cilk_frame)->scope452).noPizza));
    ((t) = (((_cilk_frame)->scope458).t));
    ((votes) = (((_cilk_frame)->scope450).votes));
    ((yesPizza) = (((_cilk_frame)->scope454).yesPizza));
    ;
    ;
    ((arr) = (((_cilk_frame)->scope447).arr));
    ((size) = (((_cilk_frame)->scope447).size));
    /* expand CILK2C_AFTER_SYNC_SLOW() macro */;
    ((Cilk_cilk2c_after_sync_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    /* expand CILK2C_AT_THREAD_BOUNDARY_SLOW() macro */;
    ((Cilk_cilk2c_at_thread_boundary_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
    ((_template__put__pointer__tag_struct_VoteSet_58__)((votes), ((Set)(((Kat)((kresult))), ((Empty)())))));
    ((_template__put__pointer__tag_struct_VoteSet_58__)((votes), ((Set)(((Horace)((hresult))), ((Empty)())))));
    ((_template__put__pointer__tag_struct_VoteSet_58__)((votes), ((Set)(((Franz)((fresult))), ((Empty)())))));
    struct _template__ActivationSet__pointer__tag_struct_VoteSet_58__  *getPiz = ((_template__get__pointer__tag_struct_VoteSet_58__)((votes), (t)));
    if (((getPiz) == (yesPizza)))
    {
      {
        ((printf)("Get pizza! At least one person will eat some.\n"));
        {
          signed int __tmp304 = 1;
          ((Cilk_set_result)((_cilk_ws), (&(__tmp304)), (sizeof((__tmp304)))));
          /* expand CILK2C_BEFORE_RETURN_SLOW macro */;
          ((Cilk_cilk2c_before_return_slow_cp)((_cilk_ws), (&((_cilk_frame)->header))));
          ((Cilk_cilk2c_before_return_slow)((_cilk_ws), (&((_cilk_frame)->header)), (sizeof((*(_cilk_frame))))));
          return ;
        }
      }
    } else {
      ;
    }
    if (((getPiz) == (noPizza)))
    {
      {
        ((printf)("Don't get pizza. Nobody will eat any.\n"));
        {
          signed int __tmp305 = 0;
          ((Cilk_set_result)((_cilk_ws), (&(__tmp305)), (sizeof((__tmp305)))));
          /* expand CILK2C_BEFORE_RETURN_SLOW macro */;
          ((Cilk_cilk2c_before_return_slow_cp)((_cilk_ws), (&((_cilk_frame)->header))));
          ((Cilk_cilk2c_before_return_slow)((_cilk_ws), (&((_cilk_frame)->header)), (sizeof((*(_cilk_frame))))));
          return ;
        }
      }
    } else {
      ;
    }
    ((printf)("Not enough information to get pizza or not!\n"));
    {
      signed int __tmp306 = (-1);
      ((Cilk_set_result)((_cilk_ws), (&(__tmp306)), (sizeof((__tmp306)))));
      /* expand CILK2C_BEFORE_RETURN_SLOW macro */;
      ((Cilk_cilk2c_before_return_slow_cp)((_cilk_ws), (&((_cilk_frame)->header))));
      ((Cilk_cilk2c_before_return_slow)((_cilk_ws), (&((_cilk_frame)->header)), (sizeof((*(_cilk_frame))))));
      return ;
    }
  }
  /* expand CILK2C_BEFORE_SYNC_SLOW() macro */;
  ((Cilk_cilk2c_before_sync_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
  ((((_cilk_frame)->header).entry) = 5);
  /* TODO: save only live, dirty variables */;
  ;
  ;
  ((((_cilk_frame)->scope447).arr) = (arr));
  ((((_cilk_frame)->scope447).size) = (size));
  if (((Cilk_sync)((_cilk_ws))))
  {
    return ;
    _cilk_sync5:;
  } else {
    ;
  }
  /* TODO: restore only live variables */;
  ;
  ;
  ((arr) = (((_cilk_frame)->scope447).arr));
  ((size) = (((_cilk_frame)->scope447).size));
  /* expand CILK2C_AFTER_SYNC_SLOW() macro */;
  ((Cilk_cilk2c_after_sync_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
  /* expand CILK2C_AT_THREAD_BOUNDARY_SLOW() macro */;
  ((Cilk_cilk2c_at_thread_boundary_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
  ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
}

#undef CILK_WHERE_AM_I
#define CILK_WHERE_AM_I IN_C_CODE

static CilkProcInfo _cilk_withCilk_sig[] = {{(sizeof(signed int)), (sizeof(struct _cilk_withCilk_frame)), (_cilk_withCilk_slow), 0, 0}, {(sizeof(YN *)), ((size_t)(((char *)(&((((struct _cilk_withCilk_frame *)0)->scope460).kresult))) - ((char *)((struct _cilk_withCilk_frame *)0)))), 0, 0, 0}, {(sizeof(YN *)), ((size_t)(((char *)(&((((struct _cilk_withCilk_frame *)0)->scope461).hresult))) - ((char *)((struct _cilk_withCilk_frame *)0)))), 0, 0, 0}, {(sizeof(YN *)), ((size_t)(((char *)(&((((struct _cilk_withCilk_frame *)0)->scope462).fresult))) - ((char *)((struct _cilk_withCilk_frame *)0)))), 0, 0, 0}, {0, 0, 0, 0, 0}, {0, 0, 0, 0, 0}};

#undef CILK_WHERE_AM_I
#define CILK_WHERE_AM_I IN_FAST_PROCEDURE

signed int withCilk(CilkWorkerState  *const  _cilk_ws, signed int  * arr, signed int  size)
{

  
  /* declare _cilk_frame and expand CILK2C_INIT_FRAME() macro */;
  struct _cilk_withCilk_frame  *_cilk_frame = ((Cilk_cilk2c_init_frame)((_cilk_ws), (sizeof(struct _cilk_withCilk_frame)), (_cilk_withCilk_sig)));
  /* expand CILK2C_START_THREAD_FAST() macro */;
  ((Cilk_cilk2c_start_thread_fast_cp)((_cilk_ws), (&((_cilk_frame)->header))));
  ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
  {
    struct _template__Lattice__pointer__tag_struct_VoteSet_58__  *D = ((_template__newLattice__pointer__tag_struct_VoteSet_58__)(((Empty)()), ((Top)()), (leq), (lub), (eq), (showVoteSet)));
    struct _template__Lvar__pointer__tag_struct_VoteSet_58__  *votes = ((_template__new__pointer__tag_struct_VoteSet_58__)((D)));
    struct _template__ActivationSet__pointer__tag_struct_VoteSet_58__  *noPizza = ((_template__newActivationSet__pointer__tag_struct_VoteSet_58__)((D), 1));
    ((_template__addAct__pointer__tag_struct_VoteSet_58__)((noPizza), ((Set)(((Horace)(((No)()))), ((Set)(((Kat)(((No)()))), ((Set)(((Franz)(((No)()))), ((Empty)())))))))));
    struct _template__ActivationSet__pointer__tag_struct_VoteSet_58__  *yesPizza = ((_template__newActivationSet__pointer__tag_struct_VoteSet_58__)((D), 20));
    ((_template__addAct__pointer__tag_struct_VoteSet_58__)((yesPizza), ((Set)(((Horace)(((Yes)()))), ((Empty)())))));
    ((_template__addAct__pointer__tag_struct_VoteSet_58__)((yesPizza), ((Set)(((Kat)(((Yes)()))), ((Empty)())))));
    ((_template__addAct__pointer__tag_struct_VoteSet_58__)((yesPizza), ((Set)(((Franz)(((Yes)()))), ((Empty)())))));
    struct _template__ThresholdSet__pointer__tag_struct_VoteSet_58__  *t = ((_template__addThreshold__pointer__tag_struct_VoteSet_58__)(((_template__addThreshold__pointer__tag_struct_VoteSet_58__)(((_template__newThresholdSet__pointer__tag_struct_VoteSet_58__)((D), 2)), (yesPizza))), (noPizza)));
    YN  *kresult;
    YN  *hresult;
    YN  *fresult;
    ((((_cilk_frame)->header).entry) = 1);
    /* TODO: save only live, dirty variables */;
    ((((_cilk_frame)->scope449).D) = (D));
    ((((_cilk_frame)->scope462).fresult) = (fresult));
    ((((_cilk_frame)->scope461).hresult) = (hresult));
    ((((_cilk_frame)->scope460).kresult) = (kresult));
    ((((_cilk_frame)->scope452).noPizza) = (noPizza));
    ((((_cilk_frame)->scope458).t) = (t));
    ((((_cilk_frame)->scope450).votes) = (votes));
    ((((_cilk_frame)->scope454).yesPizza) = (yesPizza));
    ;
    ;
    ((((_cilk_frame)->scope447).arr) = (arr));
    ((((_cilk_frame)->scope447).size) = (size));
    /* expand CILK2C_BEFORE_SPAWN_FAST() macro */;
    ((Cilk_cilk2c_before_spawn_fast_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    /* expand CILK2C_PUSH_FRAME() macro */;
    ((Cilk_cilk2c_push_frame)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((kresult) = ((getVoteSearchCilk)((_cilk_ws), (arr), (size))));
    {
      /* expand CILK2C_XPOP_FRAME_RESULT() macro */;
      YN  *__tmp310;
      if (((Cilk_cilk2c_pop_check)((_cilk_ws))))
      {
        ((__tmp310) = (kresult));
        if (((Cilk_exception_handler)((_cilk_ws), (&(__tmp310)), (sizeof((__tmp310))))))
        {
          ((Cilk_cilk2c_pop)((_cilk_ws)));
          return 0;
        } else {
          ;
        }
      } else {
        ;
      }
    }
    /* expand CILK2C_AFTER_SPAWN_FAST() macro */;
    ((Cilk_cilk2c_after_spawn_fast_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
    ((((_cilk_frame)->header).entry) = 2);
    /* TODO: save only live, dirty variables */;
    ((((_cilk_frame)->scope449).D) = (D));
    ((((_cilk_frame)->scope462).fresult) = (fresult));
    ((((_cilk_frame)->scope461).hresult) = (hresult));
    ((((_cilk_frame)->scope460).kresult) = (kresult));
    ((((_cilk_frame)->scope452).noPizza) = (noPizza));
    ((((_cilk_frame)->scope458).t) = (t));
    ((((_cilk_frame)->scope450).votes) = (votes));
    ((((_cilk_frame)->scope454).yesPizza) = (yesPizza));
    ;
    ;
    ((((_cilk_frame)->scope447).arr) = (arr));
    ((((_cilk_frame)->scope447).size) = (size));
    /* expand CILK2C_BEFORE_SPAWN_FAST() macro */;
    ((Cilk_cilk2c_before_spawn_fast_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    /* expand CILK2C_PUSH_FRAME() macro */;
    ((Cilk_cilk2c_push_frame)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((hresult) = ((getVoteSearchCilk)((_cilk_ws), (arr), (size))));
    {
      /* expand CILK2C_XPOP_FRAME_RESULT() macro */;
      YN  *__tmp311;
      if (((Cilk_cilk2c_pop_check)((_cilk_ws))))
      {
        ((__tmp311) = (hresult));
        if (((Cilk_exception_handler)((_cilk_ws), (&(__tmp311)), (sizeof((__tmp311))))))
        {
          ((Cilk_cilk2c_pop)((_cilk_ws)));
          return 0;
        } else {
          ;
        }
      } else {
        ;
      }
    }
    /* expand CILK2C_AFTER_SPAWN_FAST() macro */;
    ((Cilk_cilk2c_after_spawn_fast_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
    ((((_cilk_frame)->header).entry) = 3);
    /* TODO: save only live, dirty variables */;
    ((((_cilk_frame)->scope449).D) = (D));
    ((((_cilk_frame)->scope462).fresult) = (fresult));
    ((((_cilk_frame)->scope461).hresult) = (hresult));
    ((((_cilk_frame)->scope460).kresult) = (kresult));
    ((((_cilk_frame)->scope452).noPizza) = (noPizza));
    ((((_cilk_frame)->scope458).t) = (t));
    ((((_cilk_frame)->scope450).votes) = (votes));
    ((((_cilk_frame)->scope454).yesPizza) = (yesPizza));
    ;
    ;
    ((((_cilk_frame)->scope447).arr) = (arr));
    ((((_cilk_frame)->scope447).size) = (size));
    /* expand CILK2C_BEFORE_SPAWN_FAST() macro */;
    ((Cilk_cilk2c_before_spawn_fast_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    /* expand CILK2C_PUSH_FRAME() macro */;
    ((Cilk_cilk2c_push_frame)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((fresult) = ((getVoteSearchCilk)((_cilk_ws), (arr), (size))));
    {
      /* expand CILK2C_XPOP_FRAME_RESULT() macro */;
      YN  *__tmp312;
      if (((Cilk_cilk2c_pop_check)((_cilk_ws))))
      {
        ((__tmp312) = (fresult));
        if (((Cilk_exception_handler)((_cilk_ws), (&(__tmp312)), (sizeof((__tmp312))))))
        {
          ((Cilk_cilk2c_pop)((_cilk_ws)));
          return 0;
        } else {
          ;
        }
      } else {
        ;
      }
    }
    /* expand CILK2C_AFTER_SPAWN_FAST() macro */;
    ((Cilk_cilk2c_after_spawn_fast_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
    /* expand CILK2C_AT_SYNC_FAST() macro */;
    ((Cilk_cilk2c_at_sync_fast_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
    ((_template__put__pointer__tag_struct_VoteSet_58__)((votes), ((Set)(((Kat)((kresult))), ((Empty)())))));
    ((_template__put__pointer__tag_struct_VoteSet_58__)((votes), ((Set)(((Horace)((hresult))), ((Empty)())))));
    ((_template__put__pointer__tag_struct_VoteSet_58__)((votes), ((Set)(((Franz)((fresult))), ((Empty)())))));
    struct _template__ActivationSet__pointer__tag_struct_VoteSet_58__  *getPiz = ((_template__get__pointer__tag_struct_VoteSet_58__)((votes), (t)));
    if (((getPiz) == (yesPizza)))
    {
      {
        ((printf)("Get pizza! At least one person will eat some.\n"));
        {
          signed int _cilk_tmp = 1;
          /* expand CILK2C_BEFORE_RETURN_FAST() macro */;
          ((Cilk_cilk2c_before_return_fast_cp)((_cilk_ws), (&((_cilk_frame)->header))));
          ((Cilk_cilk2c_before_return_fast)((_cilk_ws), (&((_cilk_frame)->header)), (sizeof((*(_cilk_frame))))));
          return (_cilk_tmp);
        }
      }
    } else {
      ;
    }
    if (((getPiz) == (noPizza)))
    {
      {
        ((printf)("Don't get pizza. Nobody will eat any.\n"));
        {
          signed int _cilk_tmp = 0;
          /* expand CILK2C_BEFORE_RETURN_FAST() macro */;
          ((Cilk_cilk2c_before_return_fast_cp)((_cilk_ws), (&((_cilk_frame)->header))));
          ((Cilk_cilk2c_before_return_fast)((_cilk_ws), (&((_cilk_frame)->header)), (sizeof((*(_cilk_frame))))));
          return (_cilk_tmp);
        }
      }
    } else {
      ;
    }
    ((printf)("Not enough information to get pizza or not!\n"));
    {
      signed int _cilk_tmp = (-1);
      /* expand CILK2C_BEFORE_RETURN_FAST() macro */;
      ((Cilk_cilk2c_before_return_fast_cp)((_cilk_ws), (&((_cilk_frame)->header))));
      ((Cilk_cilk2c_before_return_fast)((_cilk_ws), (&((_cilk_frame)->header)), (sizeof((*(_cilk_frame))))));
      return (_cilk_tmp);
    }
  }
  /* expand CILK2C_AT_SYNC_FAST() macro */;
  ((Cilk_cilk2c_at_sync_fast_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
  ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
}

#undef CILK_WHERE_AM_I
#define CILK_WHERE_AM_I IN_C_CODE

static void _cilk_withCilk_import(CilkWorkerState  *const  _cilk_ws, void  * _cilk_procargs_v)
{

  ((void)(_cilk_ws));
  ((void)(_cilk_procargs_v));
  ((((struct _cilk_withCilk_args *)(_cilk_procargs_v))->_cilk_proc_result) = ((withCilk)((_cilk_ws), (((struct _cilk_withCilk_args *)(_cilk_procargs_v))->arr), (((struct _cilk_withCilk_args *)(_cilk_procargs_v))->size))));
}

#undef CILK_WHERE_AM_I
#define CILK_WHERE_AM_I IN_C_CODE

signed int mt_withCilk(CilkContext  *const  context, signed int  * arr, signed int  size)
{

  struct _cilk_withCilk_args  *_cilk_procargs = ((struct _cilk_withCilk_args *)((Cilk_malloc_fixed)((sizeof(struct _cilk_withCilk_args)))));
  (((_cilk_procargs)->arr) = (arr));
  (((_cilk_procargs)->size) = (size));
  ;
  ((Cilk_start)((context), (_cilk_withCilk_import), (_cilk_procargs), (sizeof(signed int))));
  signed int _cilk_proc_result = ((_cilk_procargs)->_cilk_proc_result);
  ((Cilk_free)((_cilk_procargs)));
  return (_cilk_proc_result);
}
struct _cilk_cilk_main_frame {
  CilkStackFrame header;
  struct  {
    char  * *argv;
    signed int argc;
    
  } scope483;
  struct  {
    signed int size;
    
  } scope484;
  struct  {
    signed int  *arr;
    
  } scope485;
  struct  {
    signed int result;
    
  } scope487;
  
};
struct _cilk_cilk_main_args {
  signed int _cilk_proc_result;
  signed int argc;
  char  * *argv;
  
};

#undef CILK_WHERE_AM_I
#define CILK_WHERE_AM_I IN_SLOW_PROCEDURE

static void _cilk_cilk_main_slow(CilkWorkerState  *const  _cilk_ws, struct _cilk_cilk_main_frame  * _cilk_frame)
{

  
  signed int argc;
  char  * *argv;
  ;
  /* expand CILK2C_START_THREAD_SLOW() macro */;
  ((Cilk_cilk2c_start_thread_slow_cp)((_cilk_ws), (&((_cilk_frame)->header))));
  ((Cilk_cilk2c_start_thread_slow)((_cilk_ws), (&((_cilk_frame)->header))));
  switch (_cilk_frame->header.entry) {case 3: goto _cilk_sync3; case 2: goto _cilk_sync2; case 1: goto _cilk_sync1; }
  /* TODO: restore only live variables */;
  ;
  ;
  {
    signed int size = 30000;
    signed int  *arr = ((randArr)((size)));
    ((nonCilk)((arr), (size)));
    signed int result;
    ((((_cilk_frame)->header).entry) = 1);
    /* TODO: save only live, dirty variables */;
    ((((_cilk_frame)->scope485).arr) = (arr));
    ((((_cilk_frame)->scope487).result) = (result));
    ((((_cilk_frame)->scope484).size) = (size));
    ;
    ;
    ((((_cilk_frame)->scope483).argc) = (argc));
    ((((_cilk_frame)->scope483).argv) = (argv));
    /* expand CILK2C_BEFORE_SPAWN_SLOW() macro */;
    ((Cilk_cilk2c_before_spawn_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    /* expand CILK2C_PUSH_FRAME() macro */;
    ((Cilk_cilk2c_push_frame)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((result) = ((withCilk)((_cilk_ws), (arr), (size))));
    ((((_cilk_frame)->scope487).result) = (result));
    {
      /* expand CILK2C_XPOP_FRAME_RESULT() macro */;
      signed int __tmp319;
      if (((Cilk_cilk2c_pop_check)((_cilk_ws))))
      {
        ((__tmp319) = (result));
        if (((Cilk_exception_handler)((_cilk_ws), (&(__tmp319)), (sizeof((__tmp319))))))
        {
          ((Cilk_cilk2c_pop)((_cilk_ws)));
          return ;
        } else {
          ;
        }
      } else {
        ;
      }
    }
    /* TODO: restore only live variables */;
    ((arr) = (((_cilk_frame)->scope485).arr));
    ((result) = (((_cilk_frame)->scope487).result));
    ((size) = (((_cilk_frame)->scope484).size));
    ;
    ;
    ((argc) = (((_cilk_frame)->scope483).argc));
    ((argv) = (((_cilk_frame)->scope483).argv));
    /* expand CILK2C_AFTER_SPAWN_SLOW() macro */;
    ((Cilk_cilk2c_after_spawn_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    /* TODO: save only live, dirty variables */;
    ((((_cilk_frame)->scope485).arr) = (arr));
    ((((_cilk_frame)->scope487).result) = (result));
    ((((_cilk_frame)->scope484).size) = (size));
    ;
    ;
    ((((_cilk_frame)->scope483).argc) = (argc));
    ((((_cilk_frame)->scope483).argv) = (argv));
    if (0)
    {
      _cilk_sync1:;
      /* TODO: restore only live variables */;
      ((arr) = (((_cilk_frame)->scope485).arr));
      ((result) = (((_cilk_frame)->scope487).result));
      ((size) = (((_cilk_frame)->scope484).size));
      ;
      ;
      ((argc) = (((_cilk_frame)->scope483).argc));
      ((argv) = (((_cilk_frame)->scope483).argv));
    } else {
      ;
    }
    /* expand CILK2C_AT_THREAD_BOUNDARY_SLOW() macro */;
    ((Cilk_cilk2c_at_thread_boundary_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
    /* expand CILK2C_BEFORE_SYNC_SLOW() macro */;
    ((Cilk_cilk2c_before_sync_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((((_cilk_frame)->header).entry) = 2);
    /* TODO: save only live, dirty variables */;
    ((((_cilk_frame)->scope485).arr) = (arr));
    ((((_cilk_frame)->scope487).result) = (result));
    ((((_cilk_frame)->scope484).size) = (size));
    ;
    ;
    ((((_cilk_frame)->scope483).argc) = (argc));
    ((((_cilk_frame)->scope483).argv) = (argv));
    if (((Cilk_sync)((_cilk_ws))))
    {
      return ;
      _cilk_sync2:;
    } else {
      ;
    }
    /* TODO: restore only live variables */;
    ((arr) = (((_cilk_frame)->scope485).arr));
    ((result) = (((_cilk_frame)->scope487).result));
    ((size) = (((_cilk_frame)->scope484).size));
    ;
    ;
    ((argc) = (((_cilk_frame)->scope483).argc));
    ((argv) = (((_cilk_frame)->scope483).argv));
    /* expand CILK2C_AFTER_SYNC_SLOW() macro */;
    ((Cilk_cilk2c_after_sync_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    /* expand CILK2C_AT_THREAD_BOUNDARY_SLOW() macro */;
    ((Cilk_cilk2c_at_thread_boundary_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
    ((free)((arr)));
    {
      signed int __tmp320 = 1;
      ((Cilk_set_result)((_cilk_ws), (&(__tmp320)), (sizeof((__tmp320)))));
      /* expand CILK2C_BEFORE_RETURN_SLOW macro */;
      ((Cilk_cilk2c_before_return_slow_cp)((_cilk_ws), (&((_cilk_frame)->header))));
      ((Cilk_cilk2c_before_return_slow)((_cilk_ws), (&((_cilk_frame)->header)), (sizeof((*(_cilk_frame))))));
      return ;
    }
  }
  /* expand CILK2C_BEFORE_SYNC_SLOW() macro */;
  ((Cilk_cilk2c_before_sync_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
  ((((_cilk_frame)->header).entry) = 3);
  /* TODO: save only live, dirty variables */;
  ;
  ;
  ((((_cilk_frame)->scope483).argc) = (argc));
  ((((_cilk_frame)->scope483).argv) = (argv));
  if (((Cilk_sync)((_cilk_ws))))
  {
    return ;
    _cilk_sync3:;
  } else {
    ;
  }
  /* TODO: restore only live variables */;
  ;
  ;
  ((argc) = (((_cilk_frame)->scope483).argc));
  ((argv) = (((_cilk_frame)->scope483).argv));
  /* expand CILK2C_AFTER_SYNC_SLOW() macro */;
  ((Cilk_cilk2c_after_sync_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
  /* expand CILK2C_AT_THREAD_BOUNDARY_SLOW() macro */;
  ((Cilk_cilk2c_at_thread_boundary_slow_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
  ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
}

#undef CILK_WHERE_AM_I
#define CILK_WHERE_AM_I IN_C_CODE

static CilkProcInfo _cilk_cilk_main_sig[] = {{(sizeof(signed int)), (sizeof(struct _cilk_cilk_main_frame)), (_cilk_cilk_main_slow), 0, 0}, {(sizeof(signed int)), ((size_t)(((char *)(&((((struct _cilk_cilk_main_frame *)0)->scope487).result))) - ((char *)((struct _cilk_cilk_main_frame *)0)))), 0, 0, 0}, {0, 0, 0, 0, 0}, {0, 0, 0, 0, 0}};

#undef CILK_WHERE_AM_I
#define CILK_WHERE_AM_I IN_FAST_PROCEDURE

signed int cilk_main(CilkWorkerState  *const  _cilk_ws, signed int  argc, char  * * argv)
{

  
  /* declare _cilk_frame and expand CILK2C_INIT_FRAME() macro */;
  struct _cilk_cilk_main_frame  *_cilk_frame = ((Cilk_cilk2c_init_frame)((_cilk_ws), (sizeof(struct _cilk_cilk_main_frame)), (_cilk_cilk_main_sig)));
  /* expand CILK2C_START_THREAD_FAST() macro */;
  ((Cilk_cilk2c_start_thread_fast_cp)((_cilk_ws), (&((_cilk_frame)->header))));
  ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
  {
    signed int size = 30000;
    signed int  *arr = ((randArr)((size)));
    ((nonCilk)((arr), (size)));
    signed int result;
    ((((_cilk_frame)->header).entry) = 1);
    /* TODO: save only live, dirty variables */;
    ((((_cilk_frame)->scope485).arr) = (arr));
    ((((_cilk_frame)->scope487).result) = (result));
    ((((_cilk_frame)->scope484).size) = (size));
    ;
    ;
    ((((_cilk_frame)->scope483).argc) = (argc));
    ((((_cilk_frame)->scope483).argv) = (argv));
    /* expand CILK2C_BEFORE_SPAWN_FAST() macro */;
    ((Cilk_cilk2c_before_spawn_fast_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    /* expand CILK2C_PUSH_FRAME() macro */;
    ((Cilk_cilk2c_push_frame)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((result) = ((withCilk)((_cilk_ws), (arr), (size))));
    {
      /* expand CILK2C_XPOP_FRAME_RESULT() macro */;
      signed int __tmp322;
      if (((Cilk_cilk2c_pop_check)((_cilk_ws))))
      {
        ((__tmp322) = (result));
        if (((Cilk_exception_handler)((_cilk_ws), (&(__tmp322)), (sizeof((__tmp322))))))
        {
          ((Cilk_cilk2c_pop)((_cilk_ws)));
          return 0;
        } else {
          ;
        }
      } else {
        ;
      }
    }
    /* expand CILK2C_AFTER_SPAWN_FAST() macro */;
    ((Cilk_cilk2c_after_spawn_fast_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
    /* expand CILK2C_AT_SYNC_FAST() macro */;
    ((Cilk_cilk2c_at_sync_fast_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
    ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
    ((free)((arr)));
    {
      signed int _cilk_tmp = 1;
      /* expand CILK2C_BEFORE_RETURN_FAST() macro */;
      ((Cilk_cilk2c_before_return_fast_cp)((_cilk_ws), (&((_cilk_frame)->header))));
      ((Cilk_cilk2c_before_return_fast)((_cilk_ws), (&((_cilk_frame)->header)), (sizeof((*(_cilk_frame))))));
      return (_cilk_tmp);
    }
  }
  /* expand CILK2C_AT_SYNC_FAST() macro */;
  ((Cilk_cilk2c_at_sync_fast_cp)((_cilk_ws), (&(((_cilk_frame)->header)))));
  ((Cilk_cilk2c_event_new_thread_maybe)((_cilk_ws)));
}

#undef CILK_WHERE_AM_I
#define CILK_WHERE_AM_I IN_C_CODE

static void _cilk_cilk_main_import(CilkWorkerState  *const  _cilk_ws, void  * _cilk_procargs_v)
{

  ((void)(_cilk_ws));
  ((void)(_cilk_procargs_v));
  ((((struct _cilk_cilk_main_args *)(_cilk_procargs_v))->_cilk_proc_result) = ((cilk_main)((_cilk_ws), (((struct _cilk_cilk_main_args *)(_cilk_procargs_v))->argc), (((struct _cilk_cilk_main_args *)(_cilk_procargs_v))->argv))));
}

#undef CILK_WHERE_AM_I
#define CILK_WHERE_AM_I IN_C_CODE

signed int mt_cilk_main(CilkContext  *const  context, signed int  argc, char  * * argv)
{

  struct _cilk_cilk_main_args  *_cilk_procargs = ((struct _cilk_cilk_main_args *)((Cilk_malloc_fixed)((sizeof(struct _cilk_cilk_main_args)))));
  (((_cilk_procargs)->argc) = (argc));
  (((_cilk_procargs)->argv) = (argv));
  ;
  ((Cilk_start)((context), (_cilk_cilk_main_import), (_cilk_procargs), (sizeof(signed int))));
  signed int _cilk_proc_result = ((_cilk_procargs)->_cilk_proc_result);
  ((Cilk_free)((_cilk_procargs)));
  return (_cilk_proc_result);
}
