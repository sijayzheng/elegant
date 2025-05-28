/**
 * 系统字典接口
 */
export const systemDictApi = {
  // 查询系统字典
  getById(id){
    return request({ url: '/systemDict/getById', method: 'get', params: { id } })
  },
  // 分页查询系统字典列表
  page(params){
    return request({ url: '/systemDict/page', method: 'get', params })
  },
  // 查询系统字典列表
  list(params){
    return request({ url: '/systemDict/list', method: 'get', params })
  },
  // 保存系统字典
  add(data){
    return request({ url: '/systemDict/add', method: 'post', data })
  },
  // 更新系统字典
  update(data){
    return request({ url: '/systemDict/update', method: 'post', data })
  },
  // 批量删除系统字典信息
  remove(data){
    return request({ url: '/systemDict/remove', method: 'delete', data })
  },
  // 导出系统字典
  exportData(data) {
    download('/systemDict/export', data, `系统字典_${getNowDate('_')}.xlsx`)
  },
  // 获取系统字典导入模板
  downloadTemplate() {
    downloadTemplate('/systemDict/downloadTemplate', `系统字典_模板_${getNowDate('_')}.xlsx`)
  },
  importUrl: '/systemDict/importData',
}
