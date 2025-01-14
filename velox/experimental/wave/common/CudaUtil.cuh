/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#pragma once

#include <cuda_runtime.h>

/// Utilities header to include in Cuda code for Velox Wave. Do not combine with
/// Velox *.h.n
namespace facebook::velox::wave {

void cudaCheck(cudaError_t err, const char* file, int line);

#define CUDA_CHECK(e) ::facebook::velox::wave::cudaCheck(e, __FILE__, __LINE__)

template <typename T, typename U>
constexpr inline T roundUp(T value, U factor) {
  return (value + (factor - 1)) / factor * factor;
}

struct StreamImpl {
  cudaStream_t stream;
};
} // namespace facebook::velox::wave
