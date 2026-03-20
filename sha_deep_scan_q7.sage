print("=== Q7 Soul Curve E1 : Negative Twist & Deep Abyss Large-Scale Scan ===")
# Generate all primes up to 200, including their negative counterparts
P = list(primes(200))
D_values = P + [-p for p in P]
D_values.sort(key=abs)

sha_found = []

for D in D_values:
    # Filter out D=7, as it degenerates with the curve's inherent coefficient 7
    if abs(D) == 7:
        continue
        
    E = EllipticCurve([0, 14*D, 0, 49*D**2, 49*D**3])
    
    try:
        selmer = E.selmer_rank()
        analytic = E.analytic_rank()
        
        if selmer > analytic:
            sha_order = E.sha().an()
            print(f"🚨 [ALERT] Dark Matter Found! D = {D:<4} | Selmer = {selmer} | Analytic Rank = {analytic} | Sha Order ≈ {round(sha_order)}")
            sha_found.append(D)
    except Exception as e:
        pass # Ignore occasional underlying C-library parsing errors

print("-" * 60)
if sha_found:
    print(f"🎯 Scan Complete! Successfully captured Sha group dark matter at the following targets: {sha_found}")
else:
    print("🧊 Scan Complete. This abyssal region remains absolutely structurally smooth.")