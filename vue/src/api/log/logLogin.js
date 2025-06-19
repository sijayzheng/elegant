/**
 * 登录日志接口
 */
export const logLoginApi = {
  // 查询登录日志
  getById(id){
    return request({ url: '/logLogin/getById', method: 'get', params: { id } })
  },
  // 分页查询登录日志列表
  page(params){
    return request({ url: '/logLogin/page', method: 'get', params })
  },
  // 查询登录日志列表
  list(params){
    return request({ url: '/logLogin/list', method: 'get', params })
  },
  // 保存登录日志
  add(data){
    return request({ url: '/logLogin/add', method: 'post', data })
  },
  // 更新登录日志
  update(data){
    return request({ url: '/logLogin/update', method: 'post', data })
  },
  // 批量删除登录日志信息
  remove(data){
    return request({ url: '/logLogin/remove', method: 'delete', data })
  },
  // 导出登录日志
  exportData(data) {
    download('/logLogin/export', data, `登录日志_${getNowDate('_')}.xlsx`)
  },
  // 获取登录日志导入模板
  downloadTemplate() {
    downloadTemplate('/logLogin/downloadTemplate', `登录日志_模板_${getNowDate('_')}.xlsx`)
  },
  importUrl: '/logLogin/importData',
}
