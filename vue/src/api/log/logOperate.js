/**
 * 操作日志接口
 */
export const logOperateApi = {
  // 查询操作日志
  getById(id){
    return request({ url: '/logOperate/getById', method: 'get', params: { id } })
  },
  // 分页查询操作日志列表
  page(params){
    return request({ url: '/logOperate/page', method: 'get', params })
  },
  // 查询操作日志列表
  list(params){
    return request({ url: '/logOperate/list', method: 'get', params })
  },
  // 保存操作日志
  add(data){
    return request({ url: '/logOperate/add', method: 'post', data })
  },
  // 更新操作日志
  update(data){
    return request({ url: '/logOperate/update', method: 'post', data })
  },
  // 批量删除操作日志信息
  remove(data){
    return request({ url: '/logOperate/remove', method: 'delete', data })
  },
  // 导出操作日志
  exportData(data) {
    download('/logOperate/export', data, `操作日志_${getNowDate('_')}.xlsx`)
  },
  // 获取操作日志导入模板
  downloadTemplate() {
    downloadTemplate('/logOperate/downloadTemplate', `操作日志_模板_${getNowDate('_')}.xlsx`)
  },
  importUrl: '/logOperate/importData',
}
