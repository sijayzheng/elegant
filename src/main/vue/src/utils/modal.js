import {ElMessageBox} from 'element-plus'

export const modal = {
  alert(message) {
    return ElMessageBox.alert(message, '系统提示', {type: 'warning'})
  },
  confirm(message) {
    return ElMessageBox.confirm(message, '系统提示', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'info',
    })
  },
  prompt(message) {
    return ElMessageBox.prompt(message, '系统提示', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning',
    })
  },

}
