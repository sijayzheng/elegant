import {ElMessage} from 'element-plus'

export const msg = {
  // 消息提示
  info(message) {
    ElMessage.info(message)
  },
  // 错误消息
  error(message) {
    ElMessage.error(message)
  },
  // 成功消息
  success(message) {
    ElMessage.success(message)
  },
  // 警告消息
  warning(message) {
    ElMessage.warning(message)
  },
}
