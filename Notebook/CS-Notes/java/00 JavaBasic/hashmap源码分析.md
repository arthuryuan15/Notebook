## Hashmap 源码分析

### 1. hash算法介绍

散列表，又称哈希表，它是基于快速存取的角度设计的，也是一种典型的“空间换时间”的做法。

散列表（hash table），是根据关键码值（key value）而直接进行访问的数据结构。

​	

（1）计算出元素(key)对应的哈希码hashcode

（2）然后对hashcode进行求余运算，计算存放的位置



### 2. hashmap源码分析

* 构造方法

  ```java
  public HashMap(Map<? extends K, ? extends V> m) {
      this.loadFactor = 0.75F;
      this.putMapEntries(m, false);
  }
  
  // 空参构造方法
  public HashMap() {
    // 0.75f 默认负载因子的赋值
    this.loadFactor = 0.75F; 
  }
  
  // int类型构造方法（初始化容量）
  public HashMap(int initialCapacity) {
    this(initialCapacity, 0.75F);
  }
  
  // 跟传统容量的构造方法一样，只不过定义了负载因子
  public HashMap(int initialCapacity, float loadFactor) {
          if (initialCapacity < 0) {
              throw new IllegalArgumentException("Illegal initial capacity: " + initialCapacity);
          } else {
              if (initialCapacity > 1073741824) {
                  initialCapacity = 1073741824;
              }
  
              if (loadFactor > 0.0F && !Float.isNaN(loadFactor)) {
                  this.loadFactor = loadFactor;
                  this.threshold = tableSizeFor(initialCapacity);
              } else {
                  throw new IllegalArgumentException("Illegal load factor: " + loadFactor);
              }
          }
  ```

* int类型构造方法

  ```java
  public HashMap(int initialCapacity, float loadFactor) {
    
  		// 判断容量initialCapacity
      if (initialCapacity < 0) {
          throw new IllegalArgumentException("Illegal initial capacity: " + initialCapacity);
      } else {
        	// 判断容量的最大值
          if (initialCapacity > 1073741824) {
              initialCapacity = 1073741824;
          }
  				// 负载因子判断
          if (loadFactor > 0.0F && !Float.isNaN(loadFactor)) {
            
              this.loadFactor = loadFactor;
            	// tableSizeFor 当前最多能放的值的数量
              this.threshold = tableSizeFor(initialCapacity);
            
          } else {
              throw new IllegalArgumentException("Illegal load factor: " + loadFactor);
          }
      }
  
  // initialCapacity = 12 
  static final int tableSizeFor(int cap) {
    // n = 12 - 1 = 11
    int n = cap - 1;
    // 0000 1011 = 11 
    // 0000 0110 = 5 (往右移动一位)
    // 0000 1111 = 15 = n（异或操作）
    n |= n >> 1;
    n |= n >> 2;
    n |= n >> 4;
    n |= n >> 8;
    n |= n >> 16;
    // 最后返回的n是离2某次方最近的数
    return n < 0 ? 1 : (n >= 1073741824 ? 1073741824 : n + 1);
  }
  ```

* 当参数是Map<? extends K, ? extends V> m

  ```java
  final void putMapEntries(Map<? extends K, ? extends V> m, boolean evict) {
    	// 判断传入集合大小
      int s = m.size();
      if (s > 0) {
        	// 当前的 HashMap.Node<K, V>[] table数组 是否为空
          if (this.table == null) { // pre-size
            
              float ft = (float)s / this.loadFactor + 1.0F;
            	
            	// 判断ft是否超过最大值，没有超过t=ft，超过用最大值 
              int t = ft < 1.07374182E9F ? (int)ft : 1073741824;
            	// 如果t超过最大容量，重新算一个最大值
              if (t > this.threshold) {
                  this.threshold = tableSizeFor(t);
              }
            
          } else if (s > this.threshold) {
            	// 扩容
              this.resize();
          }
  
          Iterator var8 = m.entrySet().iterator();
  				
        	// 取出输入的key和value，计算出hash值再重新放进去 
          while(var8.hasNext()) {
              Entry<? extends K, ? extends V> e = (Entry)var8.next();
              K key = e.getKey();
              V value = e.getValue();
              this.putVal(hash(key), key, value, false, evict);
          }
      }
    
    // 获取key的hash值
    static final int hash(Object key) {
      int h;
      // int 32位 1111 1111 1111 1111 0000 0000 0000 0000
      // 对象的hashcode值^(异或)对象的hashcode值的高位（前16位）
      // 目的：提高hashcode的随机性
      return key == null ? 0 : (h = key.hashCode()) ^ h >>> 16; // 位移运算先于异或
    }
    
    
  例如：1101 1001 = hashcode ， 容量 15 = 0000 1111
  （原来只考虑后四位）9 % 15 = 9
  1101 1001 	（0111 1001 只考虑后四位的hashcode和上面一行的一样，冲突）
  0000 1101
  ----------（^异或运算）
  1101 0100 
  0000 1111
  ----------(&与运算)
  0000 0100
  
  ```

* hashmap的put方法详解

  ```java
  public V put(K key, V value) {
    // 根据传入参数key，获取hashcode的值  
    return this.putVal(hash(key), key, value, false, true);
  }
  
  // 先定死onlyIfAbsent = false，evict = true
  final V putVal(int hash, K key, V value, boolean onlyIfAbsent, boolean evict) {
    HashMap.Node[] tab;
    int n;
    // 判断table数组是否为空或者长度为0
    if ((tab = this.table) == null || (n = tab.length) == 0) {
      // 初始化table
      n = (tab = this.resize()).length;
    }
  
    Object p;
    int i;
    // 比如当前数组的长度n为16， 16-1 
    // i= 元素在table数组中储存的位置
    // p = tab[i] p实际上链表的对象，p链表==null
    // （n-1）&hash 取余运算
    if ((p = tab[i = n - 1 & hash]) == null) {
      // 创建节点，直接存放到tab[i]位置
      tab[i] = this.newNode(hash, key, value, (HashMap.Node)null);
    } else {
      Object e;
      Object k;
  		// tab[i]有元素的情况
      if (((HashMap.Node)p).hash == hash && ((k = ((HashMap.Node)p).key) == key || key != null && key.equals(k))) {
        e = p;    // 如果hash相同，key也相同，就是同一个元素
      // 判断是否是树结构 JDK1.8 = 红黑树优化方案
      } else if (p instanceof HashMap.TreeNode) {
        // 基于红黑树的插入逻辑
        e = ((HashMap.TreeNode)p).putTreeVal(this, tab, hash, key, value);
      } else {
        int binCount = 0;
  			// 链表插入元素
        while(true) {
          // 判断((HashMap.Node)p).next)是否为空
          if ((e = ((HashMap.Node)p).next) == null) {
            ((HashMap.Node)p).next = this.newNode(hash, key, value, (HashMap.Node)null);
            // 判断当前链表的数量是否大于树结构的阈值
            if (binCount >= 7) {
              // 转换结构
              // 链表 ---> 红黑树（优化查询性能）
              this.treeifyBin(tab, hash);
            }
            break;
          }
  				// 当前链表包含要插入的值，结束变量
          if (((HashMap.Node)e).hash == hash && ((k = ((HashMap.Node)e).key) == key || key != null && key.equals(k))) {
            break;
          }
  
          p = e;
          ++binCount;
        }
      }
  		// 判断插入的值是否存在hashmap中，如果e不为空，即这里面已经有值了
      if (e != null) {
        V oldValue = ((HashMap.Node)e).value;
        if (!onlyIfAbsent || oldValue == null) {
          ((HashMap.Node)e).value = value;
        }
  
        this.afterNodeAccess((HashMap.Node)e);
        return oldValue;
      }
    }
  	// 修改次数
    ++this.modCount;
    // 判断当前数组大小是否大于阈值
    if (++this.size > this.threshold) {
      // 扩容（因为当前结构的重复率太高了）
      this.resize();
    }
  
    this.afterNodeInsertion(evict);
    return null;
  }
  
  final HashMap.Node<K, V>[] resize() {
    			
    			// 数组初始值
          HashMap.Node<K, V>[] oldTab = this.table;
    			// 扩容前的初始化
          int oldCap = oldTab == null ? 0 : oldTab.length;
          int oldThr = this.threshold;
          // 扩容前的变量初始值
    			int newThr = 0;
          int newCap;
          if (oldCap > 0) {
              if (oldCap >= 1073741824) {
                  this.threshold = 2147483647;
                  return oldTab;
              }
  						// oldCap<<1 乘以2 = 新的容量（在小于最大值且大于默认的初始容量才可以进入）
              if ((newCap = oldCap << 1) < 1073741824 && oldCap >= 16) {
                // oldThr 乘以2 = newThr   
                newThr = oldThr << 1;
              }
          } else if (oldThr > 0) {
              newCap = oldThr;
          } else {
              newCap = 16;
              newThr = 12;
          }
  
          if (newThr == 0) {
            	// 初始容量 * 负载因子 = 阈值
              float ft = (float)newCap * this.loadFactor;
              newThr = newCap < 1073741824 && ft < 1.07374182E9F ? (int)ft : 2147483647;
          }
  		
          this.threshold = newThr;
    			// 创建一个新的*2的容量的数组
          HashMap.Node<K, V>[] newTab = new HashMap.Node[newCap];
          this.table = newTab;
    			// 准备重新对元素进行定位
          if (oldTab != null) {
              for(int j = 0; j < oldCap; ++j) {
                  HashMap.Node e;
                	// 获取第j个位置的元素
                  if ((e = oldTab[j]) != null) {
                    	//清空原数组
                      oldTab[j] = null;
                    	// 判断元祐j位置上的元素是否有元素
                      if (e.next == null) {
                        // 重新计算位置，进行元素保存
                        // 例如 16
                        // e.hash * 31 = 新元素的位置
                        newTab[e.hash & newCap - 1] = e;
                      } else if (e instanceof HashMap.TreeNode) {
                        	// 红黑树拆分
                          ((HashMap.TreeNode)e).split(this, newTab, j, oldCap);
                      } else {
                          HashMap.Node<K, V> loHead = null;
                          HashMap.Node<K, V> loTail = null;
                          HashMap.Node<K, V> hiHead = null;
                          HashMap.Node hiTail = null;
  
                          HashMap.Node next;
                          do {
                            	// 遍历链表，将链表节点按照顺序进行分组
                              next = e.next;
                            	// 计算原有在扩容后，还在原位置（如果扩容后链表上值还在那个位置，就头头尾尾的串起来）
                              if ((e.hash & oldCap) == 0) {
                                	// old链表添加到一组，如果当前的尾巴没有
                                  if (loTail == null) {
                                    	// 让头等于e	  
                                    	loHead = e;
                                  } else {
                                    	// 如果当前的尾巴有值，就把尾巴指向e
                                      loTail.next = e;
                                  }
                                  loTail = e;
                                // 计算原有在扩容后，不在原位置（如果不在那个位置，就用另一个头尾串起来）
                              } else {
                                	// new链表添加到一组
                                  if (hiTail == null) {
                                      hiHead = e;
                                  } else {
                                      hiTail.next = e;
                                  }
  
                                  hiTail = e;
                              }
  
                              e = next;
                          } while(next != null);
  												// 把还在原来位置的值，链上
                          if (loTail != null) {
                              loTail.next = null;
                              newTab[j] = loHead;
                          }
  												// 不在原来位置上的值，就新加一个位置放上
                          if (hiTail != null) {
                              hiTail.next = null;
                            	// 原位置j + 原容量 = 新的位置
                              newTab[j + oldCap] = hiHead;
                          }
                      }
                  }
              }
          }
  				// 扩容之后的数组返回
          return newTab;
      }
  
  ```

* hashmap的删除remove方法

  ```java
  public boolean remove(Object key, Object value) {
    	// 返回删除出去的值 
      return this.removeNode(hash(key), key, value, true, true) != null;
  }
  
  final HashMap.Node<K, V> removeNode(int hash, Object key, Object value, boolean matchValue, boolean movable) {
          HashMap.Node[] tab;
          HashMap.Node p;
          int n;
          int index;
    
          if ((tab = this.table) != null && (n = tab.length) > 0 && 
              // 元素要存储的位置p
              (p = tab[index = n - 1 & hash]) != null) {
              HashMap.Node<K, V> node = null;
              Object k;
            
            
            	// hash没有冲突的情况
              if (p.hash == hash && ((k = p.key) == key || key != null && key.equals(k))) {
                	// 定位删除的节点node
                  node = p;
              // 有冲突，不只一个元素在同一个位置
              } else {
                  HashMap.Node e;
                  if ((e = p.next) != null) {
                    	// 红黑树，定位删除元素
                      if (p instanceof HashMap.TreeNode) {
                          node = ((HashMap.TreeNode)p).getTreeNode(hash, key);
                      } else {
                        // 链表，定位删除元素（链表一个一个往下走进行定位）
                          label88: {
                              while(e.hash != hash || (k = e.key) != key && (key == null || !key.equals(k))) {
                                  p = e;
                                  if ((e = e.next) == null) {
                                      break label88;
                                  }
                              }
  
                              node = e;
                          }
                      }
                  }
              }
  						// node 要删除的元素
              Object v;
              if (node != null && (!matchValue || (v = ((HashMap.Node)node).value) == value || value != null && value.equals(v))) {
                  if (node instanceof HashMap.TreeNode) {
                    	// 红黑树删除节点
                      ((HashMap.TreeNode)node).removeTreeNode(this, tab, movable);
                  } else if (node == p) {
                      // 链表删除节点
                    	tab[index] = ((HashMap.Node)node).next;
                  } else {
                    	// 数组中p位置的对象下一个元素=删除元素的下一个元素 
                      p.next = ((HashMap.Node)node).next;
                  }
  								// 长度--
                  ++this.modCount;
                  --this.size;
                  this.afterNodeRemoval((HashMap.Node)node);
                  // 返回元素
                	return (HashMap.Node)node;
              }
          }
  
          return null;
      }
  ```

* hashmap遍历

  ```java
  final HashMap.Node<K, V> nextNode() {
      HashMap.Node<K, V> e = this.next;
      if (HashMap.this.modCount != this.expectedModCount) {
        	// 报错的原因 
          throw new ConcurrentModificationException();
      } else if (e == null) {
          throw new NoSuchElementException();
      } else {
          HashMap.Node[] t;
        	
          if ((this.next = (this.current = e).next) == null && (t = HashMap.this.table) != null) {
            	// 寻找数组中hash槽不为空的节点
              while(this.index < t.length && (this.next = t[this.index++]) == null) {
              }
          }
          return e;
      }
  }
  ```

  