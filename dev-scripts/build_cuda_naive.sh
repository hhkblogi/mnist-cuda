set -o errexit
set -o errtrace
set -o nounset
set -o pipefail

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
WS_DIR="${CURRENT_DIR}/.."
MODULE="cuda"
OUTPUT_DIR="${WS_DIR}/output/${MODULE}"
if [ ! -d ${OUTPUT_DIR} ]; then
    mkdir -p ${OUTPUT_DIR}
fi
nvcc -o ${OUTPUT_DIR}/naive-gpu_v1 ${WS_DIR}/cuda/naive-gpu/v1.cu -lcudart

nvcc -o ${OUTPUT_DIR}/naive-gpu_v2 ${WS_DIR}/cuda/naive-gpu/v2.cu -lcudart
