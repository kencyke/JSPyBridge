from concurrent.futures import ThreadPoolExecutor, as_completed
import multiprocessing
from javascript import require


def thread_func(sleep):
    sleep(10)

if __name__ == "__main__":
    js = require("./test_broken_barrier_error.js")
    n_workers = multiprocessing.cpu_count()
    with ThreadPoolExecutor(max_workers=n_workers + 4) as executor:
        futures = [executor.submit(thread_func, js.sleep) for _ in range(100)]
        for future in as_completed(futures):
            future.result()