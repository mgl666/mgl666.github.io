# 分类体系总表

> 本文件是站点分类结构的本地存档（目录结构 / 分类名 / 中英文显示 / 序号），
> 修改分类时同步更新这里。

## 一、分类由三处共同决定

| 作用 | 文件 | 说明 |
| --- | --- | --- |
| 文章归属 | 每篇文章 front matter 的 `categories` | 一级 + 二级，如 `categories: [编程基础, Java]` |
| 中英文显示名 | `_data/categories_i18n.yml` | 键 = 分类名，值含 `en` / `zh-CN` |
| 分类排序 | `_data/categories_order.yml` | `top` 一级顺序，`sub` 各一级下的二级顺序 |
| 分类页生成 | `_plugins/article_category_pages.rb` | 自动为每个分类生成 `/categories/<slug>/` 与 `/zh/categories/<slug>/` |

**slug 规则**：`slugify(分类名, mode: "pretty")`（保留 `._~!$&'()+,;=@`，其余转 `-`），
页面与模板必须一致，否则 404。

**sort_order 规则**：`"VVVSSS.AAA"`

- `VVV`：一级分类序号（001~009）
- `SSS`：二级分类序号（001~），无二级时用 `000`
- `AAA`：文章序号（001~），分类介绍固定 `000`

## 二、一级分类（9 个）

| # | 目录 | 分类名（zh） | 英文（en） | sort_order 前缀 | 分类介绍文件 |
| --- | --- | --- | --- | --- | --- |
| 1 | `1.ML/` | 机器学习 | Machine Learning | `001` | `0.Machine_learning_intro.md` |
| 2 | `2.DL(CV)/` | 深度学习（CV） | Deep Learning (CV) | `002` | `0.Deep-Learning-CV_intro.md` |
| 3 | `3.DL(LLM)/` | 深度学习（LLM） | Deep Learning (LLM) | `003` | `0.Deep-Learning-LLM_intro.md` |
| 4 | `4.Agent/` | 智能体 | Agent | `004` | `0.Agent_intro.md` |
| 5 | `5.AI4S/` | AI4S(气象) | AI4S (Meteorology) | `005` | `0.AI4S_Meteorology_intro.md` |
| 6 | `6.Programming/` | 编程基础 | Programming Basics | `006` | `0.Programming_intro.md` |
| 7 | `7.Algorithm/` | 算法题 | Algorithm Problems | `007` | `0.Algorithm_intro.md` |
| 8 | `8.Portfolio/` | Portfolio | Portfolio | `008` | `0.Portfolio_intro.md` |
| 9 | `9.Daily_Notes/` | 日常记录 | Daily Notes | `009` | `0.Daily_intro.md` |

> 英文界面下 Portfolio 显示为 Portfolio，中文界面显示为「作品集」（由 i18n 表决定）。

## 三、二级分类（22 个）

| 所属一级 | 目录 | 分类名（zh） | 英文（en） | sort_order 前缀 | 分类介绍文件 |
| --- | --- | --- | --- | --- | --- |
| 深度学习（CV） | `1.Basics/` | CV基础知识 | Basics | `002001` | — （缺） |
| 深度学习（CV） | `2.Paper/` | CV论文 | Papers | `002002` | `1.Paper.md`（`.001`） |
| 深度学习（LLM） | `1.Basics/` | LLM基础知识 | Basics | `003001` | `0.Deep-Learning-LLM-Basics.md` |
| 深度学习（LLM） | `2.Paper/` | LLM论文 | Papers | `003002` | `1.Paper.md`（`.001`） |
| 深度学习（LLM） | `3.CS336/` | CS336 | CS336 | `003003` | `0.Stanford-CS336.md` |
| 智能体 | `1.Basics/` | 基础知识 | Basics | `004001` | — （缺） |
| 智能体 | `2.Project/` | 项目：搭建一个智能体 | Project: Build an Agent | `004002` | — （缺） |
| 智能体 | `3.OpenSourceAgents/` | 开源Agent | Open-Source Agents | `004003` | — （缺） |
| 智能体 | `4.Paper/` | Agent论文 | Papers | `004004` | `1.Paper.md`（`.001`） |
| AI4S(气象) | `1.Nowcasting/` | 短临降水预报 | Nowcasting Precipitation Forecast | `005001` | `0.AI4S_Nowcasting_intro.md` |
| AI4S(气象) | `2.Shortterm_Bias/` | 短期降水预报&偏差订正 | Short-range Precipitation Forecast & Bias Correction | `005002` | `0.AI4S_Shortterm_Bias_intro.md` |
| AI4S(气象) | `3.Foundation_Model/` | 气象大模型 | Weather Foundation Models | `005003` | `0.AI4S_Foundation_Model_intro.md` |
| AI4S(气象) | `4.S2S/` | S2S气象预报 | S2S Weather Forecast | `005004` | `0.AI4S_S2S_intro.md` |
| AI4S(气象) | `5.Data_Assimilation/` | 数据同化 | Data Assimilation | `005005` | `0.AI4S_Data_Assimilation_intro.md` |
| AI4S(气象) | `6.Ensemble_Forecast/` | 集合预报 | Ensemble Forecast | `005006` | `0.AI4S_Ensemble_Forecast_intro.md` |
| 编程基础 | `1.CPP/` | C++ | C++ | `006001` | `0.CPP_intro.md` |
| 编程基础 | `2.Python/` | Python | Python | `006002` | `0.Python_intro.md` |
| 编程基础 | `3.Java/` | Java | Java | `006003` | `0.Java_intro.md` |
| 编程基础 | `4.Database/` | 数据库 | Database | `006004` | `0.Database_intro.md` |
| 算法题 | `1.Basics/` | 算法基础知识 | Basics | `007001` | `0.Algorithm_Basics_intro.md` |
| 算法题 | `2.Hot100/` | Hot100 | Hot100 | `007002` | — （缺） |
| 算法题 | `3.Offer/` | 剑指offer | Sword Offer | `007003` | `0.Algorithm_Offer_intro.md` |

> 二级分类名带括号的（如 `C++`）在 `categories_order.yml` 中无需引号；
> 含全角冒号的（如 `项目：搭建一个智能体`）必须加引号。

## 四、快捷核对命令

```powershell
# 1) 文章用到的分类 vs i18n 登记的分类（应双向零差异）
$root='e:\OneDrive\Project\MyWeb'
$used=New-Object System.Collections.Generic.HashSet[string]
Get-ChildItem "$root\_articles" -Recurse -File -Filter *.md | ForEach-Object {
  $head=(Get-Content $_.FullName -TotalCount 12 -Encoding UTF8) -join "`n"
  $m=[regex]::Match($head,'(?m)^categories:\s*\[(.*?)\]')
  if($m.Success){ foreach($c in ($m.Groups[1].Value -split ',')){ $c=$c.Trim().Trim('"'); if($c){[void]$used.Add($c)} } }
}
$keys=New-Object System.Collections.Generic.HashSet[string]
Get-Content "$root\_data\categories_i18n.yml" -Encoding UTF8 | ForEach-Object {
  if($_ -match '^\s*("?)([^:\s][^:"]*)\1:\s*$'){ [void]$keys.Add($Matches[2]) }
}
"用到但未登记: " + (($used | Where-Object { -not $keys.Contains($_) }) -join ', ')
"登记但未使用: " + (($keys | Where-Object { -not $used.Contains($_) }) -join ', ')

# 2) 列出所有 sort_order，检查编号体系
Select-String -Path "$root\_articles\*\*.md","$root\_articles\*\*\*.md" -Pattern '^sort_order:' |
  Select-Object Path,Line
```

## 五、当前遗留项

- `2.DL(CV)/1.Basics`、`智能体/1.Basics`、`智能体/2.Project`、`智能体/3.OpenSourceAgents`、`算法题/2.Hot100` 这 5 个二级分类**没有分类介绍文件**。
- 三个 Paper 二级分类的介绍文件名为 `1.Paper.md` 且 sort_order 为 `.001`
  （其他分类介绍统一为 `0.*.md` + `.000`），属既有选择，未统一。
