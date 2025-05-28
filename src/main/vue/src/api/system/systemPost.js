/**
 * 系统岗位接口
 */
export const systemPostApi = {
  // 查询系统岗位
  getById(id){
    return request({ url: '/systemPost/getById', method: 'get', params: { id } })
  },
  // 分页查询系统岗位列表
  page(params){
    return request({ url: '/systemPost/page', method: 'get', params })
  },
  // 查询系统岗位列表
  list(params){
    return request({ url: '/systemPost/list', method: 'get', params })
  },
  // 保存系统岗位
  add(data){
    return request({ url: '/systemPost/add', method: 'post', data })
  },
  // 更新系统岗位
  update(data){
    return request({ url: '/systemPost/update', method: 'post', data })
  },
  // 批量删除系统岗位信息
  remove(data){
    return request({ url: '/systemPost/remove', method: 'delete', data })
  },
  // 导出系统岗位
  exportData(data) {
    download('/systemPost/export', data, `系统岗位_${getNowDate('_')}.xlsx`)
  },
  // 获取系统岗位导入模板
  downloadTemplate() {
    downloadTemplate('/systemPost/downloadTemplate', `系统岗位_模板_${getNowDate('_')}.xlsx`)
  },
  importUrl: '/systemPost/importData',
}
