export const debounce = (func: Function, timeout = 300) => {
  let time = 0;

  const debounceFn = (...args: any) => {
    clearTimeout(time);
    time = setTimeout(() => {
      func(...args);
    }, timeout);
  };

  return debounceFn;
};
