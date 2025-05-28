/**
 * 系统菜单接口
 */
export const systemMenuApi = {
  // 查询系统菜单
  getById(id){
    return request({ url: '/systemMenu/getById', method: 'get', params: { id } })
  },
  // 查询系统菜单列表
  list(params){
    return request({ url: '/systemMenu/list', method: 'get', params })
  },
  // 保存系统菜单
  add(data){
    return request({ url: '/systemMenu/add', method: 'post', data })
  },
  // 更新系统菜单
  update(data){
    return request({ url: '/systemMenu/update', method: 'post', data })
  },
  // 批量删除系统菜单信息
  remove(data){
    return request({ url: '/systemMenu/remove', method: 'delete', data })
  },
  // 导出系统菜单
  exportData(data) {
    download('/systemMenu/export', data, `系统菜单_${getNowDate('_')}.xlsx`)
  },
  // 获取系统菜单导入模板
  downloadTemplate() {
    downloadTemplate('/systemMenu/downloadTemplate', `系统菜单_模板_${getNowDate('_')}.xlsx`)
  },
  importUrl: '/systemMenu/importData',
}
