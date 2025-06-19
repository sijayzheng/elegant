/**
 * 系统消息接口
 */
export const systemMessageApi = {
  // 查询系统消息
  getById(id){
    return request({ url: '/systemMessage/getById', method: 'get', params: { id } })
  },
  // 分页查询系统消息列表
  page(params){
    return request({ url: '/systemMessage/page', method: 'get', params })
  },
  // 查询系统消息列表
  list(params){
    return request({ url: '/systemMessage/list', method: 'get', params })
  },
  // 保存系统消息
  add(data){
    return request({ url: '/systemMessage/add', method: 'post', data })
  },
  // 更新系统消息
  update(data){
    return request({ url: '/systemMessage/update', method: 'post', data })
  },
  // 批量删除系统消息信息
  remove(data){
    return request({ url: '/systemMessage/remove', method: 'delete', data })
  },
  // 导出系统消息
  exportData(data) {
    download('/systemMessage/export', data, `系统消息_${getNowDate('_')}.xlsx`)
  },
  // 获取系统消息导入模板
  downloadTemplate() {
    downloadTemplate('/systemMessage/downloadTemplate', `系统消息_模板_${getNowDate('_')}.xlsx`)
  },
  importUrl: '/systemMessage/importData',
}
