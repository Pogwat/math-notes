#set align(center)
$
  "let" m_a=sum_(b=0)^(a-1)[m_b] \
  m_a = m_0+m_1+m_2+...+m_(a-1) \
$
pop one off the top
$
m_a=sum_(b=0)^(a-1)[m_b] \
m_a=sum_(b=0)^(a-2)[m_b]+ m_(a-1) \
m_a=sum_(b=0)^(a-2)[m_b]+ sum_(b=0)^(a-3)[m_b]+ m_(a-2) \

m_a=sum_(b=0)^(a-2)[m_b]+ sum_(b=0)^(a-3)[m_b]+...+ sum_(b=0)^(a-a)[m_b]+ m_(a-(a-1)) \
m_a=sum_(b=0)^(a-2)[m_b]+ sum_(b=0)^(a-3)[m_b]+...+ sum_(b=0)^(a-a)[m_b]+ sum_(b=0)^(a-(a-1)-2)[m_b]+ m_(a-(a-1)-1) \
m_a=sum_(b_0=0)^(a-2)[sum_(b_1=0)^(b)[m_(b_1)]] + m_0 \
m_a=sum_(b_0=1)^(a-1)[sum_(b_1=0)^(b-1)[m_(b_1)]] + m_0 \
m_a=sum_(b_0=0)^(a-1)[sum_(b_1=0)^(b-1)[m_(b_1)]]  - sum_(b_1=0)^(0-1)[m_(b_1)] + m_0 \
m_a=sum_(b_0=0)^(a-1)[sum_(b_1=0)^(b-1)[m_(b_1)]] + m_0


"a clever substitution in terms of m_a"  \
m_a=sum_(b=0)^(a-2)[m_b]+ m_(a-1) \

m_a=sum_(b=0)^(a-1)[m_b] \
m_(a-1) = sum_(b=0)^(a-2)[m_b] \
m_a=2m_(a-1) \
m_a= 2^x m_(a-x) \
m_a = 2^a m_0

$
